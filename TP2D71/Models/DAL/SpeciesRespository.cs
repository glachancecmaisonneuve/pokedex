using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TP2D71.Models.DataModels;

namespace TP2D71.Models.DAL
{
    public class SpeciesRespository : Repository<Species>
    {
        protected const string SPECIES_INSERT = @"INSERT INTO Species(Name) VALUES(@Name);";
        protected const string SPECIES_DELETE = @"DELETE Species WHERE SpeciesID=@SpeciesID";
        protected const string SPECIES_UPDATE = @"UPDATE Species SET Name=@Name WHERE SpeciesID=@SpeciesID";
        protected const string SPECIES_SELECT_ALL = @"SELECT SpeciesID,Name FROM Species ORDER BY Name ASC;";
        protected const string SPECIES_SELECT_ONE = @"SELECT SpeciesID,Name  FROM  Species WHERE SpeciesID=@SpeciesID";

        public override void Add(ref Species s) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(SPECIES_INSERT, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("Name", s.Name);
                    connection.Open();
                    s.SpeciesID = Convert.ToInt32(command.ExecuteScalar());
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("Species " + s.Name + " n'a pas pu être créé.  (Raison probable : Un Species du même nom existe déjà.)", e);
            }
        }

        public override void Remove(int SpeciesID) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(SPECIES_DELETE, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("SpeciesID", SpeciesID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'Species n'a pas pu être supprimé.  (Raison probable : Un pokémon utilise cet Species.)", e);
            }
        }

        public override void Update(Species s) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(SPECIES_UPDATE, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("SpeciesID", s.SpeciesID);
                    command.Parameters.AddWithValue("Name", s.Name);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'Species n'a pas pu être modifié.)", e);
            }
        }

        protected override IEnumerable<Species> GetEnumerable() {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(SPECIES_SELECT_ALL, connection) { CommandType = CommandType.Text };
                using (SqlDataReader dr = command.ExecuteReader()) while (dr.Read()) yield return ConvertReaderToEntity(dr);


            }
        }

        public override Species Find(int SpeciesID) {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(SPECIES_SELECT_ONE, connection) { CommandType = CommandType.Text };
                command.Parameters.AddWithValue("SpeciesID", SpeciesID);
                using (SqlDataReader dr = command.ExecuteReader()) if (dr.Read()) return ConvertReaderToEntity(dr);

            }

            return null;
        }

        protected override Species ConvertReaderToEntity(IDataRecord dr) {
            return new Species {
                SpeciesID = (int)dr["SpeciesID"],
                Name = dr["Name"].ToString()
            };
        }
    }
}
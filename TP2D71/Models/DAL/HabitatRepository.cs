using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TP2D71.Models.DataModels;

namespace TP2D71.Models.DAL
{
    public class HabitatRepository : Repository<Habitat>
    {
        protected const string HABITAT_INSERT = @"INSERT INTO Habitat(Name) VALUES(@Name);";
        protected const string HABITAT_DELETE = @"DELETE Habitat WHERE HabitatID=@HabitatID";
        protected const string HABITAT_UPDATE = @"UPDATE Habitat SET Name=@Name WHERE HabitatID=@HabitatID";
        protected const string HABITAT_SELECT_ALL = @"SELECT HabitatID,Name FROM Habitat ORDER BY Name ASC;";
        protected const string HABITAT_SELECT_ONE = @"SELECT HabitatID,Name  FROM  Habitat WHERE HabitatID=@HabitatID";

        public override void Add(ref Habitat entity) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(HABITAT_INSERT, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("Name", entity.Name);
                    connection.Open();
                    entity.HabitatID = Convert.ToInt32(command.ExecuteScalar());
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'habitat " + entity.Name + " n'a pas pu être créé.  (Raison probable : Un habitat du même nom existe déjà.)", e);
            }
        }

        public override void Remove(int HabitatID) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(HABITAT_DELETE, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("HabitatID", HabitatID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'habitat n'a pas pu être supprimé.  (Raison probable : Un pokémon utilise cet habitat.)", e);
            }
        }

        public override void Update(Habitat entity) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(HABITAT_UPDATE, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("HabitatID", entity.HabitatID);
                    command.Parameters.AddWithValue("Name", entity.Name);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'habitat n'a pas pu être modifié.)", e);
            }
        }

        protected override IEnumerable<Habitat> GetEnumerable() {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(HABITAT_SELECT_ALL, connection) { CommandType = CommandType.Text };
                using (SqlDataReader dr = command.ExecuteReader()) while (dr.Read()) yield return ConvertReaderToEntity(dr);


            }
        }

        public override Habitat Find(int HabitatID) {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(HABITAT_SELECT_ONE, connection) { CommandType = CommandType.Text };
                command.Parameters.AddWithValue("HabitatID", HabitatID);
                using (SqlDataReader dr = command.ExecuteReader()) if (dr.Read()) return ConvertReaderToEntity(dr);

            }
            return null;
        }

        protected override Habitat ConvertReaderToEntity(IDataRecord dr) {
            return new Habitat { HabitatID = (int)dr["HabitatID"], Name = dr["Name"].ToString() };
        }
    }
}
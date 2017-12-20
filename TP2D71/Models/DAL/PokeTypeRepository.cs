using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TP2D71.Models.DataModels;

namespace TP2D71.Models.DAL
{
    public class PokeTypeRepository : Repository<PokeType>
    {
        protected const string POKETYPE_INSERT = @"INSERT INTO PokeType(Name) VALUES(@Name);";
        protected const string POKETYPE_DELETE = @"DELETE PokeType WHERE PokeTypeID=@PokeTypeID";
        protected const string POKETYPE_UPDATE = @"UPDATE PokeType SET Name=@Name WHERE PokeTypeID=@PokeTypeID";
        protected const string POKETYPE_SELECT_ALL = @"SELECT PokeTypeID,Name FROM PokeType ORDER BY Name ASC;";
        protected const string POKETYPE_SELECT_ONE = @"SELECT PokeTypeID,Name  FROM  PokeType WHERE PokeTypeID=@PokeTypeID";

        public override void Add(ref PokeType entity) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(POKETYPE_INSERT, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("Name", entity.Name);
                    connection.Open();
                    entity.PokeTypeID = Convert.ToInt32(command.ExecuteScalar());
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("Le PokeType " + entity.Name + " n'a pas pu être créé.  (Raison probable : Un PokeType du même nom existe déjà.)", e);
            }
        }

        public override void Remove(int PokeTypeID) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(POKETYPE_DELETE, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("PokeTypeID", PokeTypeID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'PokeType n'a pas pu être supprimé.  (Raison probable : Un pokémon utilise cet PokeType.)", e);
            }
        }

        public override void Update(PokeType entity) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(POKETYPE_UPDATE, connection) { CommandType = CommandType.Text };
                    command.Parameters.AddWithValue("PokeTypeID", entity.PokeTypeID);
                    command.Parameters.AddWithValue("Name", entity.Name);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'PokeType n'a pas pu être modifié.)", e);
            }
        }

        protected override IEnumerable<PokeType> GetEnumerable() {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(POKETYPE_SELECT_ALL, connection) { CommandType = CommandType.Text };
                using (SqlDataReader dr = command.ExecuteReader()) while (dr.Read()) yield return ConvertReaderToEntity(dr);


            }
        }

        public override PokeType Find(int PokeTypeID) {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(POKETYPE_SELECT_ONE, connection) { CommandType = CommandType.Text };
                command.Parameters.AddWithValue("PokeTypeID", PokeTypeID);
                using (SqlDataReader dr = command.ExecuteReader()) if (dr.Read()) return ConvertReaderToEntity(dr);

            }

            return null;
        }

        protected override PokeType ConvertReaderToEntity(IDataRecord dr) {
            return new PokeType { PokeTypeID = (int)dr["PokeTypeID"], Name = dr["Name"].ToString() };
        }
    }
}
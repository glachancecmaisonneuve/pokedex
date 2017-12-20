using PasswordHashing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TP2D71.Models.DataModels;

namespace TP2D71.Models.DAL
{
    public class UtilisateurRepository : Repository<Utilisateur>
    {
        protected const string UTILISATEUR_INSERT = @"INSERT INTO Utilisateur(NomUtilisateur,HashMotDePasse,Courriel) OUTPUT INSERTED.UtilisateurID VALUES(@NomUtilisateur,@HashMotDePasse,@Courriel);";
        protected const string UTILISATEUR_DELETE = @"DELETE Utilisateur WHERE UtilisateurID=@UtilisateurID";
        protected const string UTILISATEUR_UPDATE = @"UPDATE Utilisateur SET NomUtilisateur=@NomUtilisateur,HashMotDePasse=@HashMotDePasse,Courriel=@Courriel WHERE UtilisateurID=@UtilisateurID";
        protected const string UTILISATEUR_SELECTALL = @"SELECT UtilisateurID,NomUtilisateur,HashMotDePasse,Courriel  FROM  Utilisateur";
        protected const string UTILISATEUR_FINDBYID = @"SELECT UtilisateurID,NomUtilisateur,HashMotDePasse,Courriel  FROM  Utilisateur WHERE UtilisateurID=@UtilisateurID";
        protected const string UTILISATEUR_FINDBYUSERNAME = @"SELECT UtilisateurID,NomUtilisateur,HashMotDePasse,Courriel  FROM  Utilisateur WHERE NomUtilisateur=@NomUtilisateur";
        protected const string UTILISATEUR_FINDBYEMAIL = @"SELECT UtilisateurID,NomUtilisateur,HashMotDePasse,Courriel  FROM  Utilisateur WHERE NomUtilisateur=@NomUtilisateur";

        public override void Add(ref Utilisateur u) {
            // TODO: HASH du password
            try {
                u.HashMotDePasse = PasswordHash.CreateHash(u.HashMotDePasse);
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(UTILISATEUR_INSERT, connection);
                    command.Parameters.AddWithValue("NomUtilisateur", u.NomUtilisateur);
                    command.Parameters.AddWithValue("HashMotDePasse", u.HashMotDePasse);
                    command.Parameters.AddWithValue("Courriel", u.Courriel);
                    connection.Open();
                    u.UtilisateurID = Convert.ToInt32(command.ExecuteScalar());
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("Vous êtes déjà inscrit.  SVP utiliser le formulaire de login.", e);
            }
        }

        public override void Remove(int UtilisateurID) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(UTILISATEUR_DELETE, connection);
                    command.Parameters.AddWithValue("UtilisateurID", UtilisateurID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("Impossible de supprimer ce pokémon.", e);
            }
        }

        public override void Update(Utilisateur entity) {
            try {
                // TODO: HASH du password
                entity.HashMotDePasse = PasswordHash.CreateHash(entity.HashMotDePasse);
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    var command = new SqlCommand(UTILISATEUR_UPDATE, connection);
                    command.Parameters.AddWithValue("UtilisateurID", entity.UtilisateurID);
                    command.Parameters.AddWithValue("NomUtilisateur", entity.NomUtilisateur);
                    command.Parameters.AddWithValue("HashMotDePasse", entity.HashMotDePasse);
                    command.Parameters.AddWithValue("Courriel", entity.Courriel);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'opération de modification du compte a échouée.", e);
            }
        }

        protected override IEnumerable<Utilisateur> GetEnumerable() {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                using (var command = new SqlCommand(UTILISATEUR_SELECTALL, connection) { CommandType = CommandType.Text }) {
                    var dr = command.ExecuteReader();
                    while (dr.Read()) yield return ConvertReaderToEntity(dr);

                }
            }
        }

        public override Utilisateur Find(int UtilisateurID) {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                using (var command = new SqlCommand(UTILISATEUR_FINDBYID, connection) { CommandType = CommandType.Text }) {
                    command.Parameters.AddWithValue("UtilisateurID", UtilisateurID);
                    var dr = command.ExecuteReader();
                    if (dr.Read()) return ConvertReaderToEntity(dr);
                }
            }

            return null;
        }

        public Utilisateur FindByEmail(string courriel) {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                using (var command = new SqlCommand(UTILISATEUR_FINDBYEMAIL, connection) { CommandType = CommandType.Text }) {
                    command.Parameters.AddWithValue("Courriel", courriel);
                    var dr = command.ExecuteReader();
                    if (dr.Read()) return ConvertReaderToEntity(dr);
                }
            }

            return null;
        }

        public Utilisateur FindByUsername(string nomUtilisateur) {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                using (var command = new SqlCommand(UTILISATEUR_FINDBYUSERNAME, connection) { CommandType = CommandType.Text }) {
                    command.Parameters.AddWithValue("NomUtilisateur", nomUtilisateur);
                    var dr = command.ExecuteReader();
                    if (dr.Read()) return ConvertReaderToEntity(dr);
                }
            }

            return null;
        }

        protected override Utilisateur ConvertReaderToEntity(IDataRecord dr) {
            return new Utilisateur { UtilisateurID = (int)dr["UtilisateurID"], NomUtilisateur = dr["NomUtilisateur"].ToString(), HashMotDePasse = dr["HashMotDePasse"].ToString(), Courriel = dr["Courriel"].ToString() };
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using TP2D71.Models.DataModels;

namespace TP2D71.Models.DAL
{
    public class FavoritesRepository
    {
        public FavoritesRepository(int UtilisateurID) {
            this.UtilisateurID = UtilisateurID;
        }

        protected internal int UtilisateurID { get; protected set; }

        /// <summary>
        ///     Ajoute un pokémon à l'utilisateur
        /// </summary>
        /// <param name="pokemonID"></param>
        public void Add(int pokemonID) {
#pragma warning disable 0162
            throw new NotImplementedException();
            // Consiste à écrire un INSERT INTO dans la table favorite
            // -- UtilisateurID contient le ID de l'utilisateur pour lequel ajouter le favori
            // -- PokemonID contient le ID du Pokemon pour lequel ajouter le favori
            var chaineConnexion = ConfigurationManager.ConnectionStrings["Pokedex"].ConnectionString;
            const string COMMAND_TEXT = @"SPÉCIFIER LE INSERT INTO Favorites ICI";
            using (var connection = new SqlConnection(chaineConnexion)) {
                var command = new SqlCommand(COMMAND_TEXT, connection) { CommandType = CommandType.Text };
                command.Parameters.AddWithValue("NomDuParamètre", "NomDeLaValeur");
                command.Parameters.AddWithValue("NomDuParamètre", "NomDeLaValeur");
                connection.Open();
                command.ExecuteNonQuery();
            }
#pragma warning restore 0162
        }

        public void Remove(int PokemonID) {
            // Consiste à écrire un DELETE dans la table favorite
            // -- UtilisateurID contient le ID de l'utilisateur pour lequel ajouter le favori
            // -- PokemonID contient le ID du Pokemon pour lequel ajouter le favori
            throw new NotImplementedException();
        }

        /// <summary>
        ///     Retourne la liste des pokémons favoris de cet utilisateur
        /// </summary>
        /// <returns>La liste des pokémons favoris de cet utilisateur ou null si aucun</returns>
        public List<Pokemon> List() {
            throw new NotImplementedException();
        }
    }
}
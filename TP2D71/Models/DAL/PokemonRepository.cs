using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TP2D71.Models.DataModels;

namespace TP2D71.Models.DAL
{
    public class PokemonRepository : Repository<Pokemon>
    {
        protected const string POKEMON_INSERT =
            @"INSERT INTO Pokemon(Name,HP,Attack,Defense,SpecialAttack,SpecialDefense,Speed,Height,Weight,Color,FKPoketypeID01,FKPoketypeID02,FKHabitatID,FKSpeciesID,EvolvesInto) " +
            "VALUES(@Name,@HP,@Attack,@Defense,@SpecialAttack,@SpecialDefense,@Speed,@Height,@Weight,@Color,@FKPoketypeID01,@FKPoketypeID02,@FKHabitatID,@FKSpeciesID,,@ImgURL,@EvolvesInto,@ThumbURL,@CryURL);";
        protected const string POKEMON_DELETE = @"DELETE Pokemon WHERE PokemonID=@PokemonID";
        protected const string POKEMON_UPDATE =
            @"UPDATE Pokemon SET Name=@Name,HP=@HP,Attack=@Attack,Defense=@Defense,SpecialAttack=@SpecialAttack,SpecialDefense=@SpecialDefense,Speed=@Speed,Height=@Height,Weight=@Weight,Color=@Color,FKPoketypeID01=@FKPoketypeID01,FKPoketypeID02=@FKPoketypeID02,FKHabitatID=@FKHabitatID,FKSpeciesID=@FKSpeciesID,EvolvesInto=@EvolvesInto WHERE PokemonID=@PokemonID";
        protected const string POKEMON_SELECTALL =
            @"SELECT PokemonID,Name,HP,Attack,Defense,SpecialAttack,SpecialDefense,Speed,Height,Weight,Color,FKPoketypeID01,FKPoketypeID02,FKHabitatID,FKSpeciesID,EvolvesInto FROM Pokemon";
        protected const string POKEMON_EVOLUTIONS_POSSIBLES =
            @"SELECT PokemonID,Name,HP,Attack,Defense,SpecialAttack,SpecialDefense,Speed,Height,Weight,Color,FKPoketypeID01,FKPoketypeID02,FKHabitatID,FKSpeciesID,EvolvesInto FROM  Pokemon WHERE PokemonID NOT IN (SELECT Pokemon.EvolvesInto);";
        protected const string POKEMON_FIND =
            @"SELECT PokemonID,Name,HP,Attack,Defense,SpecialAttack,SpecialDefense,Speed,Height,Weight,Color,FKPoketypeID01,FKPoketypeID02,FKHabitatID,FKSpeciesID,EvolvesInto FROM Pokemon WHERE PokemonID=@PokemonID";

        public override void Add(ref Pokemon entity) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    connection.Open();
                    var command = new SqlCommand(POKEMON_INSERT, connection);
                    TransfererParametres(command, entity);
                    entity.PokemonID = Convert.ToInt32(command.ExecuteScalar());
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("Une erreur s'est produite lors de la création du Pokémon.  Erreur probable : Il existe un pokémon du même nom.", e);
            }
        }

        public override void Remove(int PokemonID) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    connection.Open();
                    var command = new SqlCommand(POKEMON_DELETE, connection);
                    command.Parameters.AddWithValue("PokemonID", PokemonID);
                    connection.Open();
                    command.ExecuteScalar();
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("Impossible de supprimer ce pokémon.", e);
            }
        }

        public override void Update(Pokemon entity) {
            try {
                using (var connection = new SqlConnection(ChaineConnexion)) {
                    connection.Open();
                    var command = new SqlCommand(POKEMON_UPDATE, connection);
                    TransfererParametres(command, entity);
                    var rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected != 1) throw new Exception("Didnt work");
                }
            } catch (SqlException e) {
                throw new PokedexFailedOperationException("L'opération de modification du pokémon a échouée.", e);
            }
        }

        public IEnumerable<Pokemon> ListEvolutionsPossibles() {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(POKEMON_EVOLUTIONS_POSSIBLES, connection);
                using (SqlDataReader dr = command.ExecuteReader()) while (dr.Read()) yield return ConvertReaderToEntity(dr);


            }
        }

        protected override IEnumerable<Pokemon> GetEnumerable() {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(POKEMON_SELECTALL, connection);
                using (SqlDataReader dr = command.ExecuteReader()) while (dr.Read()) yield return ConvertReaderToEntity(dr);


            }
        }

        public override Pokemon Find(int PokemonID) {
            using (var connection = new SqlConnection(ChaineConnexion)) {
                connection.Open();
                var command = new SqlCommand(POKEMON_FIND, connection);
                command.Parameters.AddWithValue("PokemonID", PokemonID);
                using (SqlDataReader dr = command.ExecuteReader()) if (dr.Read()) return ConvertReaderToEntity(dr);

            }

            return null;
        }

        protected override Pokemon ConvertReaderToEntity(IDataRecord dr) {
            return new Pokemon {
                PokemonID = (int)dr["PokemonID"],
                Name = dr["Name"].ToString(),
                HP = (byte)dr["HP"],
                Attack = (byte)dr["Attack"],
                Defense = (byte)dr["Defense"],
                SpecialAttack = (byte)dr["SpecialAttack"],
                SpecialDefense = (byte)dr["SpecialDefense"],
                Speed = (byte)dr["Speed"],
                Height = (decimal)dr["Height"],
                Weight = (decimal)dr["Weight"],
                Color = (Pokemon.PokeColor)dr["Color"],
                FKPoketypeID01 = (int)dr["FKPoketypeID01"],
                FKPoketypeID02 = DBNull.Value.Equals(dr["FKPoketypeID02"]) ? null : (int?)dr["FKPoketypeID02"],
                FKHabitatID = (int)dr["FKHabitatID"],
                FKSpeciesID = (int)dr["FKSpeciesID"],
                EvolvesInto = DBNull.Value.Equals(dr["EvolvesInto"]) ? null : (int?)dr["EvolvesInto"]
            };
        }

        protected void TransfererParametres(SqlCommand command, Pokemon entity) {
            command.Parameters.AddWithValue("PokemonID", entity.PokemonID);
            command.Parameters.AddWithValue("Name", entity.Name);
            command.Parameters.AddWithValue("HP", entity.HP);
            command.Parameters.AddWithValue("Attack", entity.Attack);
            command.Parameters.AddWithValue("Defense", entity.Defense);
            command.Parameters.AddWithValue("SpecialAttack", entity.SpecialAttack);
            command.Parameters.AddWithValue("SpecialDefense", entity.SpecialDefense);
            command.Parameters.AddWithValue("Speed", entity.Speed);
            command.Parameters.AddWithValue("Height", entity.Height);
            command.Parameters.AddWithValue("Weight", entity.Weight);
            command.Parameters.AddWithValue("Color", entity.Color);
            command.Parameters.AddWithValue("FKPoketypeID01", entity.FKPoketypeID01);
            command.Parameters.AddWithValue("FKPoketypeID02", entity.FKPoketypeID02 ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("FKHabitatID", entity.FKHabitatID);
            command.Parameters.AddWithValue("FKSpeciesID", entity.FKSpeciesID);
            command.Parameters.AddWithValue("EvolvesInto", entity.EvolvesInto ?? (object)DBNull.Value);
        }
    }
}
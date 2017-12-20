namespace TP2D71.Models.DAL
{
    public class Pokedex
    {
        public Pokedex() {
            Pokemons = new PokemonRepository();
            PokeTypes = new PokeTypeRepository();
            Species = new SpeciesRespository();
            Utilisateurs = new UtilisateurRepository();
            Habitats = new HabitatRepository();
        }

        public PokemonRepository Pokemons { get; private set; }
        public PokeTypeRepository PokeTypes { get; private set; }
        public SpeciesRespository Species { get; private set; }
        public UtilisateurRepository Utilisateurs { get; private set; }
        public HabitatRepository Habitats { get; private set; }
    }
}
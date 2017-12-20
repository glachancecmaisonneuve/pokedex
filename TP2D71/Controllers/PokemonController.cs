using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using TP2D71.Models.DAL;
using TP2D71.Models.DataModels;

namespace TP2D71.Controllers
{
    public class PokemonController : Controller
    {
        public Pokedex Pokedex = new Pokedex();

        [HttpGet]
        //TODO: Filtrer listePokemons 
        public ActionResult Index(int filtrePoketype = -1, int filtreHabitat = -1, int filtreSpecies = -1) {
            var listePokemons = Pokedex.Pokemons.List();
            if (filtreHabitat != -1)
                listePokemons = listePokemons.FindAll(p => p.FKHabitatID == filtreHabitat);
            if (filtrePoketype != -1)
                listePokemons = listePokemons.FindAll(p => p.FKPoketypeID01 == filtrePoketype || p.FKPoketypeID02 == filtrePoketype);
            if (filtreSpecies != -1)
                listePokemons = listePokemons.FindAll(p => p.FKSpeciesID == filtreSpecies);
            return View(listePokemons);
        }

        [HttpGet]
        public ActionResult Edit(int id) {
            var p = Pokedex.Pokemons.Find(id);
            return View(p);
        }

        [HttpPost]
        public ActionResult Edit(Pokemon p, HttpPostedFileBase NewImgURL, HttpPostedFileBase NewCryURL, HttpPostedFileBase NewThumbURL) {
            if (ModelState.IsValid) {
                Pokedex.Pokemons.Update(p);
                //Le ? dans ce contexte, est un raccourci pour l'expression "if (NewCryURL != Null) { NewCryURL.SaveAS...}"
                NewCryURL?.SaveAs(Server.MapPath($"/Content/cries/{p.PokemonID}.ogg"));
                NewImgURL?.SaveAs(Server.MapPath($"/Content/img/{p.PokemonID}.png"));
                NewThumbURL?.SaveAs(Server.MapPath($"/Content/sprites/{p.PokemonID}.png"));
                return RedirectToAction("Index", "Pokemon");
            }
            return View(p);
        }

        [HttpGet]
        public ActionResult PokemonParHabitat(int HabitatID) {
            return PartialView(Pokedex.Pokemons.List().FindAll(p => p.FKHabitatID == HabitatID));
        }
    }
}
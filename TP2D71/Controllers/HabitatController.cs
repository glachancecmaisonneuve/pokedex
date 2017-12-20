using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TP2D71.Models.DAL;

namespace TP2D71.Controllers
{
    public class HabitatController : Controller
    {
        Pokedex pokedex = new Pokedex();
        public ActionResult Index() => View(pokedex.Habitats.List());
    }
}

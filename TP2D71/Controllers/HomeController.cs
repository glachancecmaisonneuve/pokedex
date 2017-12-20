using System.Web.Mvc;

namespace TP2D71.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index() => RedirectToAction("Index", "Pokemon");
        public ActionResult MenuLogin() => PartialView();
    }
}
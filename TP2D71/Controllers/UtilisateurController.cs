using System;
using System.Data.Common;
using System.Web.Mvc;
using System.Web.Security;
using TP2D71.Models.DAL;
using TP2D71.Models.DataModels;
using TP2D71.Models.ViewModels;

namespace TP2D71.Controllers
{

    [Authorize]
    public class UtilisateurController : Controller
    {
        protected Pokedex Pokedex = new Pokedex();

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Inscription() => View(new InscriptionView());

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Inscription(InscriptionView iv) {
            // TODO: Après une inscription réussie, l'utilisateur devrait être déjà connecté.
            if (ModelState.IsValid) {
                try {
                    Utilisateur u = iv.GetUtilisateur(); //appel du implicit operator
                    Pokedex.Utilisateurs.Add(ref u);
                    FormsAuthentication.SetAuthCookie(u.UtilisateurID.ToString(), false);
                    return RedirectToAction("Index", "Pokemon");
                } catch (PokedexFailedOperationException e) {
                    ModelState.AddModelError(string.Empty, e.Message);
                }
            }

            return View(iv);
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Login() => View(new LoginView());

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(LoginView lv) {
            if (ModelState.IsValid) {
                var u = Pokedex.Utilisateurs.FindByUsername(lv.NomUtilisateur);
                FormsAuthentication.SetAuthCookie(u.UtilisateurID.ToString(), lv.ResterConnecté);
            } else {
                return View(lv);
            }

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult Logout() {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult Edit() {
            var UtilisateurID = Convert.ToInt32(User.Identity.Name);
            var u = Pokedex.Utilisateurs.Find(UtilisateurID);
            u.HashMotDePasse = "";
            return View(u);
        }

        [HttpPost]
        public ActionResult Edit(Utilisateur u) {
            if (ModelState.IsValid) {
                try {
                    //Attention à UtilisateurID qui pourrait avoir été déshoumphé
                    u.UtilisateurID = Int32.Parse(User.Identity.Name);
                    Pokedex.Utilisateurs.Update(u);
                } catch (DbException e) {
                    ModelState.AddModelError(string.Empty, e.Message);
                    return View(u);
                }
            }

            return RedirectToAction("Index", "Pokemon");
        }

        [HttpPost]
        public ActionResult Delete() {
            if (ModelState.IsValid) {
                var UtilisateurID = Int32.Parse(User.Identity.Name);
                try {
                    Pokedex.Utilisateurs.Remove(UtilisateurID);
                    FormsAuthentication.SignOut();
                } catch (DbException e) {
                    ModelState.AddModelError(string.Empty, e.Message);
                    return View("Edit", Pokedex.Utilisateurs.Find(UtilisateurID));
                }
            }

            return RedirectToAction("Index", "Pokemon");
        }

    }
}
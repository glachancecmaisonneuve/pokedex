using System.ComponentModel.DataAnnotations;
using TP2D71.Models.DAL;
using TP2D71.Models.DataModels;

namespace TP2D71.Models.ViewModels
{
    [CustomValidation(typeof(LoginView), "ValidateurLoginView")]
    public class LoginView
    {
        [Required, MinLength(2), MaxLength(20), Display(Name = "Utilisateur :")]
        public string NomUtilisateur { get; set; }
        [Required, DataType(DataType.Password), MinLength(6), MaxLength(12), Display(Name = "Mot de passe :")]
        public string MotDePasse { get; set; }
        [Display(Name = "Rester connecté :")]
        public bool ResterConnecté { get; set; }

        public static ValidationResult ValidateurLoginView(LoginView lv) {
            var pokedex = new Pokedex();
            var u = pokedex.Utilisateurs.FindByUsername(lv.NomUtilisateur);
            if (u == null) {
                return new ValidationResult("Login Invalide");
            }
            if (!PasswordHashing.PasswordHash.ValidatePassword(lv.MotDePasse, u.HashMotDePasse)) {
                return new ValidationResult("Login Invalide (mauvais mot de passe)");
            }
            return ValidationResult.Success;
        }
    }
}
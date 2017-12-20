using System.ComponentModel.DataAnnotations;
using TP2D71.Models.DataModels;

namespace TP2D71.Models.ViewModels
{
    public class InscriptionView
    {
        [Required, MinLength(2), MaxLength(20), Display(Name = "Utilisateur")]
        public string NomUtilisateur { get; set; }
        [Required, DataType(DataType.Password), MinLength(6), MaxLength(12), Compare("ConfirmationMotDePasse"), Display(Name = "Mot de passe")]
        public string MotDePasse { get; set; }
        [Required, DataType(DataType.Password), MinLength(6), MaxLength(12), Compare("MotDePasse"), Display(Name = "Confirmer le mot de passe")]
        public string ConfirmationMotDePasse { get; set; }
        [Required, EmailAddress, MaxLength(100), Display(Name = "Courriel")]
        public string Courriel { get; set; }


        public Utilisateur GetUtilisateur() {
            return new Utilisateur {
                NomUtilisateur = this.NomUtilisateur,
                HashMotDePasse = this.MotDePasse,
                Courriel = this.Courriel
            };
        }
        //En 2018 ==> garder cette version de conversion implicite
        /*
        public static implicit operator Utilisateur(InscriptionView iv) {
            return new Utilisateur {
                NomUtilisateur = iv.NomUtilisateur,
                HashMotDePasse = iv.MotDePasse,
                Courriel = iv.Courriel
            };
        }
        */

    }
}
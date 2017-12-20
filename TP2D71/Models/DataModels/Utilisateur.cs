using System.ComponentModel.DataAnnotations;
using TP2D71.Models.DAL;

namespace TP2D71.Models.DataModels
{
    public class Utilisateur
    {
        [Key]
        public int UtilisateurID { get; set; }
        [Required, MinLength(2), MaxLength(12)]
        public string NomUtilisateur { get; set; }
        [DataType(DataType.Password), Required, MinLength(6)]
        public string HashMotDePasse { get; set; }
        [DataType(DataType.EmailAddress), Required]
        public string Courriel { get; set; }

        public FavoritesRepository Favorites => new FavoritesRepository(UtilisateurID);
    }
}
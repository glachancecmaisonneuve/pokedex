using System.ComponentModel.DataAnnotations;

namespace TP2D71.Models.DataModels
{
    public class PokeType
    {
        [Key]
        public int PokeTypeID { get; set; }
        [Required, MaxLength(15), Display(Name = "PokeType")]
        public string Name { get; set; }
    }
}
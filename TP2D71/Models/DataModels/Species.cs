using System.ComponentModel.DataAnnotations;

namespace TP2D71.Models.DataModels
{
    public class Species
    {
        [Key]
        public int SpeciesID { get; set; }
        [Required, MaxLength(15), Display(Name = "Species")]
        public string Name { get; set; }
    }
}
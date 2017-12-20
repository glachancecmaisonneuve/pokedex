using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace TP2D71.Models.DataModels
{
    public class Habitat
    {
        [Key, Required, Display(AutoGenerateField = true), HiddenInput(DisplayValue = false)]
        public int HabitatID { get; set; }
        [Required, MaxLength(15), Display(Name = "Habitat")]
        public string Name { get; set; }
    }
}
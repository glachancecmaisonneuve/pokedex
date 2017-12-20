using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;
using TP2D71.Models.DAL;

namespace TP2D71.Models.DataModels
{
    [DisplayColumn("Name")]
    public class Pokemon
    {
        public enum PokeColor
        {
            [Display(Name = "Black")]
            Black = 0x000000,
            [Display(Name = "Blue")]
            Blue = 0x0000FF,
            [Display(Name = "Brown")]
            Brown = 0xCD853F,
            [Display(Name = "Gray")]
            Gray = 0x808080,
            [Display(Name = "Green")]
            Green = 0x008000,
            [Display(Name = "Pink")]
            Pink = 0xFFC0CB,
            [Display(Name = "Purple")]
            Purple = 0x800080,
            [Display(Name = "Red")]
            Red = 0xFF0000,
            [Display(Name = "White")]
            White = 0xF5F5F5,
            [Display(Name = "Yellow")]
            Yellow = 0xFFFF00
        }

        [Key, HiddenInput(DisplayValue = false)]
        public int PokemonID { get; set; }
        [Required, MaxLength(15)]
        public string Name { get; set; }
        [Required, Range(0, 255)]
        public byte HP { get; set; }
        [Required, Range(0, 255)]
        public byte Attack { get; set; }
        [Required, Range(0, 255)]
        public byte Defense { get; set; }
        [Required, Range(0, 255), Display(Name = "Special Atk")]
        public byte SpecialAttack { get; set; }
        [Required, Range(0, 255), Display(Name = "Special Def")]
        public byte SpecialDefense { get; set; }
        [Required, Range(0, 255)]
        public byte Speed { get; set; }
        [Required, Range(0, 999)]
        public decimal Height { get; set; }
        [Required, Range(0, 999)]
        public decimal Weight { get; set; }

        // 0 Black, 1 Blue, 2 Brown, 3 Gray, 4 Green, 5 Pink, 6 Purple, 7 Red, 8 White, 9 Yellow
        [Required, DisplayFormat(DataFormatString = "{0:x6}")]
        public PokeColor Color { get; set; }
        [Required, ForeignKey("PokeType01"), Display(Name = "Poketype 01")]
        public int FKPoketypeID01 { get; set; }
        [ForeignKey("PokeType02"), Display(Name = "Poketype 02")]
        public int? FKPoketypeID02 { get; set; }
        [Required, Display(Name = "Habitat")]
        public int FKHabitatID { get; set; }
        [Required, Display(Name = "Species")]
        public int FKSpeciesID { get; set; }
        public string ImgURL => $"/Content/img/{PokemonID}.png";
        public string CryURL => $"/Content/cries/{PokemonID}.ogg";
        public string ThumbURL => $"/Content/sprites/{PokemonID}.png";
        [Display(Name = "Évolution")]
        public int? EvolvesInto { get; set; }
        [Display(Name = "Habitat"), Editable(false)]
        public Habitat Habitat {
            get { return new HabitatRepository().Find(FKHabitatID); }
        }
        [Display(Name = "Species"), Editable(false)]
        public Species Species {
            get { return new SpeciesRespository().Find(FKSpeciesID); }
        }
        [Display(Name = "PokeType 01"), ForeignKey("PokeTypeID"), Editable(false)]
        public PokeType PokeType01 {
            get { return new PokeTypeRepository().Find(FKPoketypeID01); }
        }
        [Display(Name = "PokeType 02"), ForeignKey("PokeTypeID"), Editable(false)]
        public PokeType PokeType02 {
            get { return FKPoketypeID02 == null ? null : new PokeTypeRepository().Find(FKPoketypeID02.Value); }
        }
        [Display(Name = "Évolution"), ForeignKey("PokeTypeID")]
        public Pokemon Evolution {
            get { return EvolvesInto == null ? null : new PokemonRepository().Find(EvolvesInto.Value); }
        }
    }
}
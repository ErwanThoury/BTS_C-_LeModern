using System;
using System.Collections.Generic;
using System.Text;

namespace model
{
    public class Film
    {
        public string libelleFilm { get; set; }
        public int anneeSortie { get; set; }
        public Genre unGenre { get; set; }
        public Realisateur unRealisateur { get; set; }
    }
}

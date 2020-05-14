using System;
using System.Collections.Generic;
using System.Text;

namespace model
{
    public class Reservation
    {
        public string nomDuClient { get; set; }
        public int nbClientPlace { get; set; }
        public Projeter uneProjetion { get; set; }
    }
}

using model;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;

namespace GestionnaireBDD
{
    public class GstBDD
    {
        MySqlConnection cnx;
        MySqlCommand cmd;
        MySqlDataReader dr;

        public GstBDD()
        {
            string driver = "server=localhost;user id=root;password=;database=lemodern";
            cnx = new MySqlConnection(driver);
            cnx.Open();
        }

        public List<Realisateur> GetLesRealisateurs() 
        {
            List<Realisateur> l = new List<Realisateur>();

            cmd = new MySqlCommand(" select nomRealisateur from realisateur; ", cnx);
            dr = cmd.ExecuteReader();

            while (dr.Read()) // Equivalent au Fetch
            {
                Realisateur r = new Realisateur()
                {
                    nomRealisateur = dr[0].ToString()
                };
                l.Add(r);
            }
            dr.Close();

            return l;
        }

        public List<Genre> GetLesGenres()
        {
            List<Genre> l = new List<Genre>();

            cmd = new MySqlCommand(" select libelleGenre from genre; ", cnx);
            dr = cmd.ExecuteReader();

            while (dr.Read()) // Equivalent au Fetch
            {
                Genre g = new Genre()
                {
                    libelleGenre = dr[0].ToString()
                };
                l.Add(g);
            }
            dr.Close();

            return l;
        }

        public List<Salle> GetLesSalles()
        {
            List<Salle> l = new List<Salle>();

            cmd = new MySqlCommand(" select nomSalle, descriptionSalle, nbPlace from salle; ", cnx);
            dr = cmd.ExecuteReader();

            while (dr.Read()) // Equivalent au Fetch
            {
                Salle s = new Salle()
                {
                    nomSalle = dr[0].ToString(),
                    descriptionSalle = dr[1].ToString(),
                    nbPlace = Convert.ToInt32(dr[2])
                };
                l.Add(s);
            }
            dr.Close();

            return l;
        }

        public List<Projeter> GetLesProjeter()
        {
            List<Projeter> l = new List<Projeter>();

            cmd = new MySqlCommand("Select descriptionSalle, nbPlace, nomSalle, anneeSortie, libelleFilm, libelleGenre, nomRealisateur, dateHeure, idProjection From genre inner join film on idGenre=numGenre inner join realisateur on idRealisateur=numRealisateur inner join projeter on idFilm=numFilm inner join salle on numSalle=idSalle ORDER BY dateHeure;", cnx);
            dr = cmd.ExecuteReader();

            while (dr.Read()) // Equivalent au Fetch
            {
                Projeter p = new Projeter()
                {
                    uneSalle = new Salle()
                    {
                        descriptionSalle = dr[0].ToString(),
                        nbPlace = Convert.ToInt32(dr[1]),
                        nomSalle = dr[2].ToString()
                    },
                    unFilm = new Film()
                    {
                        anneeSortie = Convert.ToInt32(dr[3]),
                        libelleFilm = dr[4].ToString(),
                        unGenre = new Genre()
                        {
                            libelleGenre = dr[5].ToString()
                        },
                        unRealisateur = new Realisateur()
                        {
                            nomRealisateur = dr[6].ToString()
                        }
                    },
                    unHoraire = Convert.ToDateTime(dr[7]),
                    numProj = dr[8].ToString()
                };
                l.Add(p);
            }
            dr.Close();

            return l;
        }
        public void ReserverPlace(Reservation reserver) 
        {
            string nom = reserver.nomDuClient;
            string nbPlace = reserver.nbClientPlace.ToString();
            string libelFilm = reserver.uneProjetion.unFilm.libelleFilm;
            string horaireF = reserver.uneProjetion.unHoraire.ToString();
            string nomSal = reserver.uneProjetion.uneSalle.nomSalle;
            string numProj = reserver.uneProjetion.numProj;
            cmd = new MySqlCommand("INSERT INTO `reservation` (`idReservation`, `nomDuClient`, `nbClientReservation`, `numProjection`) VALUES (NULL, '" + nom + "', '" + nbPlace + "', '" + numProj + "');", cnx);
            cmd.ExecuteNonQuery();
            
        }
        public int NombrePlaceRestant(Projeter projection) 
        {
            int nbPlaceSalleRestant;
            int nbPlacePrise=0;
            string proj = projection.numProj;

            cmd = new MySqlCommand("select nbClientReservation as m from projeter inner join reservation on idProjection=numProjection inner join film on numFilm = idFilm inner join salle on numSalle = idSalle where numProjection = " + proj, cnx);
            dr = cmd.ExecuteReader();

            while (dr.Read()) 
            {
                nbPlacePrise += Convert.ToInt32(dr[0]);
            }
            
            dr.Close();
            nbPlaceSalleRestant = projection.uneSalle.nbPlace - nbPlacePrise;
            return nbPlaceSalleRestant;
        }
        /*
        public int NumeroProjection(string lf, string ls, string lh)
        {
            int numProjec=0;
            cmd = new MySqlCommand("select idProjection from projeter inner join reservation on idProjection=numProjection inner join film on numFilm = idFilm inner join salle on numSalle = idSalle where nomSalle = '" + ls + "' AND libelleFilm = '" + lf + "' AND dateHeure='" + lh + "'", cnx);
            dr = cmd.ExecuteReader();
            while (dr.Read()) 
            {
                numProjec = Convert.ToInt32(dr[0]);
            }
            
            dr.Close();
           
            return numProjec;
        }
        */
    }
}

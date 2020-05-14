using GestionnaireBDD;
using model;
using System;
using System.Collections.Generic;
using System.Linq;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

// Pour plus d'informations sur le modèle d'élément Page vierge, consultez la page https://go.microsoft.com/fwlink/?LinkId=402352&clcid=0x409

namespace projetLeModern
{
    /// <summary>
    /// Une page vide peut être utilisée seule ou constituer une page de destination au sein d'un frame.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        public MainPage()
        {
            this.InitializeComponent();

        }
        GstBDD bdd;       
        List<Realisateur> lr = new List<Realisateur>();
        List<Genre> lg = new List<Genre>();        
        List<Salle> ls = new List<Salle>();
        List<Projeter> lp = new List<Projeter>();

        List<Film> lf = new List<Film>();
        List<Reservation> lres = new List<Reservation>();

        Boolean sa = false;
        Boolean ra = false;
        Boolean ga = false;
        Boolean da = false;

        DateTimeOffset? dpf;
        string dateSelect;
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            bdd = new GstBDD();


            foreach (Realisateur r in bdd.GetLesRealisateurs()) 
            {
                lr.Add(r);
            }

            foreach (Genre g in bdd.GetLesGenres())
            {
                lg.Add(g);
            }

            foreach (Salle s in bdd.GetLesSalles())
            {
                ls.Add(s);
            }

            foreach (Projeter p in bdd.GetLesProjeter())
            {
                lp.Add(p);
            }

            
            lvRealisateur.ItemsSource = lr;
            lvGenre.ItemsSource = lg;
            lvSalle.ItemsSource = ls;
            lvSeance.ItemsSource = lp;

        }
        private void remplirLesSeances()
        {
            List<Projeter> lpt = new List<Projeter>();
            foreach (Projeter p in lp) 
            {
                lpt.Add(p);
            }
            foreach (Projeter p in lpt.ToList())
            {
                if ((sa == true && p.uneSalle.nomSalle != (lvSalle.SelectedItem as Salle).nomSalle)
                    ||(ga == true && p.unFilm.unGenre.libelleGenre != (lvGenre.SelectedItem as Genre).libelleGenre) 
                    ||(ra == true && p.unFilm.unRealisateur.nomRealisateur != (lvRealisateur.SelectedItem as Realisateur).nomRealisateur) 
                    ||(da == true && p.unHoraire.ToString().Substring(0, 10) != dateSelect))
                {
                    lpt.Remove(p);
                }
            }
            lvSeance.ItemsSource = lpt;
        }
        private void lvSalle_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            lvSeance.ItemsSource = null;
            sa = true;
            remplirLesSeances();
        }

        private void lvGenre_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            lvSeance.ItemsSource = null;
            ga = true; 
            remplirLesSeances();
        }

        private void lvRealisateur_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            lvSeance.ItemsSource = null;
            ra = true;  
            remplirLesSeances();
        }

        private async void btnReservation_Click(object sender, RoutedEventArgs e)
        {
            if (lvSeance.SelectedItem == null)
            {
                var dialog = new MessageDialog("Sélectionnez une séance");
                await dialog.ShowAsync();
            }
            else
            {
                if (txtNom.Text == "")
                {
                    var dialog = new MessageDialog("Entrez un nom");
                    await dialog.ShowAsync();
                }
                else
                { 
                    Projeter pro = lvSeance.SelectedItem as Projeter;
                    Reservation r = new Reservation()
                    {
                        nomDuClient = txtNom.Text,
                        nbClientPlace = Convert.ToInt32(sldNbPersonne.Value),
                        uneProjetion = pro
                    };
                    int nombrePlaceRes = bdd.NombrePlaceRestant(pro);
                    if (nombrePlaceRes - r.nbClientPlace >= 0)
                    {
                        bdd.ReserverPlace(r);
                        var dialog = new MessageDialog("1 place réservé");
                        if (r.nbClientPlace > 1)
                        {
                            dialog = new MessageDialog(r.nbClientPlace + " places réservées");
                        }

                        await dialog.ShowAsync();
                    }
                    else
                    {
                        var dialog = new MessageDialog("Places non réservées, il n'en reste que " + nombrePlaceRes);
                        await dialog.ShowAsync();
                    }
                    lres.Add(r);
                }
            }

            
        }

        private void CalendarDatePicker_DateChanged(CalendarDatePicker sender, CalendarDatePickerDateChangedEventArgs args)
        {
            lvSeance.ItemsSource = null;
            dpf = new DateTimeOffset?();
            dpf = cdpDate.Date;
            dateSelect = dpf.ToString();
            dateSelect = dateSelect.Substring(0, 10);
            da = true;
            remplirLesSeances();
        }

        private void btnSalleReset_Click(object sender, RoutedEventArgs e)
        {
            sa = false;
            remplirLesSeances();
        }

        private void btnGenreReset_Click(object sender, RoutedEventArgs e)
        {
            ga = false;
            remplirLesSeances();
        }

        private void btnRealisateurReset_Click(object sender, RoutedEventArgs e)
        {
            ra = false;
            remplirLesSeances();
        }

        private void btnDateReset_Click(object sender, RoutedEventArgs e)
        {
            da = false;
            remplirLesSeances();
        }
    }
}

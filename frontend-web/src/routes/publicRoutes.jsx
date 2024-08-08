import Login from "src/pages/Auth/Login";
import Register from "src/pages/Auth/Register";
import { AboutUsPage } from "src/Website/AboutUs";
import { Contact } from "src/Website/Contact";
import Feature from "src/Website/Feature";
import Hero from "src/Website/Hero";
import LandingPage from "src/Website/LandingPage";
import { Offer } from "src/Website/Offer";

export const publicRoutes = [
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/register",
    element: <Register />,
  },
  {
    path: "/home",
    element: <LandingPage />,
  },
  {
    path: "/homePage",
    element: <Hero />,
  },
  {
    path: "/aboutUs",
    element: <AboutUsPage />,
  },

  {
    path: "/Features",
    element: <Feature />,
  },

  {
    path: "/contactUs",
    element: <Contact />,
  },

  {
    path: "/Offers",
    element: <Offer />,
  },



 


  // Add more public routes here
];

import Login from "src/pages/Auth/Login";
import Register from "src/pages/Auth/Register";
import LandingPage from "src/Website/LandingPage";

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



 


  // Add more public routes here
];

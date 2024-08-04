import Main from 'src/components/Main';
import Dashboard from "src/Page/Dashboard";
import LisCandidate from 'src/pages/Candidate/ListCandidate';
import DeleteProfile from 'src/pages/CompanyPost/DeleteProfile';
import Edit from 'src/pages/CompanyProfile/Edit';
import Profile from 'src/pages/CompanyProfile/Profile';
import AddJob from 'src/pages/JobPosting/AddJob';
import DeleteJob from 'src/pages/JobPosting/DeleteJob';
import EditJob from 'src/pages/JobPosting/EditJob';
import JobDetail from 'src/pages/JobPosting/JobDetail';
import JobTable from 'src/pages/JobPosting/JobTable';
import { ProtectedRoute } from './ProtectedRouteComponent';
import TotalCadidate from 'src/pages/Candidate/TotalCadidate';
import CV from 'src/pages/Candidate/CV';
import CoverLetter from 'src/pages/Candidate/CoverLetter';
import EmailForm from 'src/pages/Email/EmailForm';

export const protectedRoutes = [
  {
    path: '/',
    element: <ProtectedRoute />,
    children: [
      {
        path: '/',
        element: (
          <Main>
            <Dashboard />
          </Main>
        ),
      },
     
      {
        path: '/job/table',
        element: (
          <Main>
            <JobTable />
          </Main>
        ),
      },
      {
        path: '/job/create',
        element: (
          <Main>
            <AddJob />
          </Main>
        ),
      },
      {
        path: '/details/job/:jobId',
        element: (
          <Main>
            <JobDetail />
          </Main>
        ),
      },
      {
        path: '/edit/job/:jobId',
        element: (
          <Main>
            <EditJob />
          </Main>
        ),
      },
      {
        path: '/delete/job/:jobId',
        element: (
          <Main>
            <DeleteJob />
          </Main>
        ),
      },
      {
        path: '/totle/application',
        element: (
          <Main>
            <TotalCadidate />
          </Main>
        ),
      },
      {
        path: '/company/profile',
        element: (
          <Main>
            <Profile />
          </Main>
        ),
      },
      {
        path: '/edit/company/profile',
        element: (
          <Main>
            <Edit />
          </Main>
        ),
      },
      {
        path: '/delete/company/:companyId',
        element: (
          <Main>
            <DeleteProfile />
          </Main>
        ),
      },


      // for list application 
      {
        path: '/all/application/apply',
        element: (
          <Main>
            <LisCandidate />
          </Main>
        ),
      },

      {
        path: '/apply/application/cv/:applicationId',
        element: (
          <Main>
            <CV />
          </Main>
        ),
      },


      {
        path: '/apply/application/cover-letter/:applicationId',
        element: (
          <Main>
            <CoverLetter/>
          </Main>
        ),
      },


      // Email 

      {
        path: '/email/:id',
        element: (
          <Main>
            <EmailForm />
          </Main>
        ),
      },


    
    ],
  },
];

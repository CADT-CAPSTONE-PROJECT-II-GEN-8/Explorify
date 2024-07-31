import Main from 'src/components/Main';
import Dashboard from "src/Page/Dashboard";
import UI from 'src/pages/CompanyProfile/UI';
import JobTable from 'src/pages/JobPosting/JobTable';
import AddJob from 'src/pages/JobPosting/AddJob';
import JobDetail from 'src/pages/JobPosting/JobDetail';
import EditJob from 'src/pages/JobPosting/EditJob';
import DeleteJob from 'src/pages/JobPosting/DeleteJob';
import Test from 'src/components/Test';
import ViewDetail from 'src/pages/CompanyPost/ViewDetail';
import Edit from 'src/pages/CompanyPost/Edit';
import DeleteProfile from 'src/pages/CompanyPost/DeleteProfile';
import { ProtectedRoute } from './ProtectedRouteComponent';
import Profile from 'src/pages/CompanyProfile/Profile';
import LisCandidate from 'src/pages/Candidate/ListCandidate';

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
        path: '/UI',
        element: (
          <Main>
            <UI />
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
        path: '/test',
        element: (
          <Main>
            <Test />
          </Main>
        ),
      },
      {
        path: '/company/profile',
        element: (
          <Main>
           <Profile/>
          </Main>
        ),
      },
      {
        path: '/details/company/:companyId',
        element: (
          <Main>
            <ViewDetail />
          </Main>
        ),
      },
      {
        path: '/edit/company/:companyId',
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

    ],
  },
];

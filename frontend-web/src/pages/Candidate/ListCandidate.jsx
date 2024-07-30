import axios from "axios";
import { useEffect, useState } from "react";
import JobBar from "../JobPosting/JobBar";
import Header from "../JobPosting/Header";

const ListCandidate = () => {
  const [jobs, setJobs] = useState([]);

  const getStatusClass = (status) => {
    switch (status) {
      case 'Closed':
        return 'bg-red-500 text-white';
      case 'Open':
        return 'bg-amber-500 text-white';
      case 'Filled':
        return 'bg-gray-500 text-white';
      default:
        return 'bg-amber-100 text-amber-400';
    }
  };

  useEffect(() => {
    axios
      .get("http://localhost:8989/api/v1/internship/list/all/")
      .then((response) => setJobs(response.data))
      .catch((error) => console.error("Error fetching data", error));
  }, []);

  return (
    <>
    <Header/>
    <section className="py-10 sm:py-5">
      <div className="mx-auto max-w-screen-2xl lg:px-1">
        <div className="relative overflow-hidden bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
          <JobBar />
          <div className="overflow-x-auto">
            <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
              <thead className="text-xs text-[#F27C1C] uppercase bg-[#fef2e8] dark:bg-gray-700 dark:text-gray-400">
                <tr>
                  <th scope="col" className="p-4">
                    <div className="flex items-center">
                      <input
                        id="checkbox-all"
                        type="checkbox"
                        className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                      />
                      <label htmlFor="checkbox-all" className="sr-only">
                        checkbox
                      </label>
                    </div>
                  </th>
                  <th scope="col" className="px-4 py-3">Name</th>
                  <th scope="col" className="px-4 py-3">Position</th>
                  <th scope="col" className="px-4 py-3">Cover Letter</th>
                  <th scope="col" className="px-4 py-3">Resume</th>
                  <th scope="col" className="px-4 py-3">Approval</th>
                  <th scope="col" className="px-4 py-3">Rejected</th>
                </tr>
              </thead>
              <tbody>
                {jobs.map((job) => (
                  <tr
                    key={job.internship_application_id}
                    className="border-b dark:border-gray-600 hover:bg-[#fef2e8] dark:hover:bg-gray-700"
                  >
                    <td className="w-4 px-4 py-3">
                      <div className="flex items-center">
                        <input
                          id={`checkbox-${job.internship_application_id}`}
                          type="checkbox"
                          className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                        />
                        <label
                          htmlFor={`checkbox-${job.internship_application_id}`}
                          className="sr-only"
                        >
                          checkbox
                        </label>
                      </div>
                    </td>
                    <td className="flex items-center px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                      {job.user}
                    </td>
                    <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                      {job.internship_post}
                    </td>
                    <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                      <a href={job.cover_letter} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">
                        View Cover Letter
                      </a>
                    </td>
                    <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                      <a href={job.cv} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">
                        View Resume
                      </a>
                    </td>
                    <td className="pl-2 flex items-center">
                      <span className={`text-xs font-medium px-3 py-0.5 rounded-full ${getStatusClass(job.status)}`}>
                        {job.is_approved}
                      </span>
                    </td>
                    <td className="pl-2 flex items-center">
                      <span className={`text-xs font-medium px-3 py-0.5 rounded-full ${getStatusClass(job.status)}`}>
                        {job.is_rejected}
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>
    </>
  );
};

export default ListCandidate;

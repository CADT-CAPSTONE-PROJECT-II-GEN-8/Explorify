import { useEffect, useState } from "react";
import { FaCheckCircle, FaTimesCircle } from "react-icons/fa";
import Pagination from "src/components/Pagination";
import Search from "src/components/Search";
import Spinner from "src/components/SmallComponents/Spinner";
import axiosInstance from "src/utils/axiosInstance";
import Header from "../JobPosting/Header";
import CV from "./CV";
import CoverLetter from "./CoverLetter";

const ListCandidate = () => {
  const [jobs, setJobs] = useState([]);
  const [filteredJobs, setFilteredJobs] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(10);

  useEffect(() => {
    axiosInstance.get("internship/list/all/")
      .then((response) => {
        setJobs(response.data);
        setFilteredJobs(response.data);
        setLoading(false);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
        setError(error);
        setLoading(false);
      });
  }, []);

  useEffect(() => {
    // Filter jobs based on the search term
    setFilteredJobs(
      jobs.filter(job =>
        job.job_title.toLowerCase().includes(searchTerm.toLowerCase())
      )
    );
    setCurrentPage(1); // Reset to first page when search term changes
  }, [searchTerm, jobs]);

  const totalPages = Math.ceil(filteredJobs.length / itemsPerPage);
  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  const currentItems = filteredJobs.slice(startIndex, endIndex);

  const handlePageChange = (newPage) => {
    setCurrentPage(newPage);
  };

  const handleSearchChange = (value) => {
    setSearchTerm(value);
  };

  if (loading) {
    return <div><Spinner /></div>;
  }

  if (error) {
    return <div>Error loading data: {error.message}</div>;
  }

  return (
    <>
      <Header />
      <section className="py-10 sm:py-5">
        <div className="mx-auto max-w-screen-2xl lg:px-1">
          <div className="relative overflow-hidden bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
            {/* Use Search component */}
            <div className="flex flex-col items-center justify-between p-4 space-y-3 md:flex-row md:space-y-0 md:space-x-4">
              <div className="w-full md:w-1/2">
                <Search searchTerm={searchTerm} onSearchChange={handleSearchChange} />
              </div>
              {/* Uncomment this section if needed */}
              {/* <Link to='/job/create'>
                <button type="button" className="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-amber-600 hover:bg-primary-800 focus:ring-[#f7ac70]  focus:border-[#f7ac70] dark:bg-primary-600 ">
                  <svg className="h-3.5 w-3.5 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                    <path clipRule="evenodd" fillRule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" />
                  </svg>
                  Add new post
                </button>
              </Link> */}
            </div>

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
                  {currentItems.map((job) => (
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
                        <div className="flex items-center gap-x-2">
                          <img className="object-cover w-10 h-10 rounded-full" src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80" alt />
                          <div>
                            <h2 className="text-sm font-medium text-gray-800 dark:text-white ">{job.username}</h2>

                          </div>
                        </div>

                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        {job.job_title}
                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        <div className="items-center">
                          <CoverLetter />
                        </div>
                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        <div className="items-center">
                          <CV />
                        </div>
                      </td>
                      <td className="pl-10 px-4 py-2">
                        <FaCheckCircle className="mr-3 text-amber-600 w-4 h-4" />
                      </td>
                      <td className="pl-10 px-4 py-2">
                        <FaTimesCircle className="mr-3 text-red-600 w-4 h-4" />
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            {/* Pagination Controls */}
            <Pagination
              currentPage={currentPage}
              totalPages={totalPages}
              onPageChange={handlePageChange}
            />
          </div>
        </div>
      </section>
    </>
  );
};

export default ListCandidate;

import { useEffect, useState } from "react";
import { FaEye, FaPenAlt } from "react-icons/fa";
import { Link } from "react-router-dom";
import axiosInstance from "src/utils/axiosInstance";
import DeleteJob from "./DeleteJob";
import Header from "./Header";
import Search from "src/components/Search";
import Pagination from "src/components/Pagination";
const JobTable = () => {
  const [jobs, setJobs] = useState([]);
  const [filteredJobs, setFilteredJobs] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(10);

  useEffect(() => {
    axiosInstance
      .get('internship-posts/')
      .then((response) => {
        setJobs(response.data.results);
        console.log(response.data);
        setFilteredJobs(response.data.results); // Initialize filteredJobs with the full list
      })
      .catch((error) => console.error('Error fetching data', error));
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
              <Link to='/job/create'>
                <button type="button" class="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-amber-600 hover:bg-primary-800 focus:ring-[#f7ac70]  focus:border-[#f7ac70] dark:bg-primary-600 ">
                  <svg class="h-3.5 w-3.5 mr-2" fill="currentColor" viewbox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                    <path clip-rule="evenodd" fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" />
                  </svg>
                  Add new post
                </button>
              </Link>
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
                    <th scope="col" className="px-4 py-3">Job Title</th>
                    <th scope="col" className="px-4 py-3">Salary</th>
                    <th scope="col" className="px-4 py-3">Duration</th>
                    <th scope="col" className="px-4 py-3">Job Type</th>
                    <th scope="col" className="px-4 py-3">Status</th>
                    <th scope="col" className="px-4 py-3">Action</th>
                    <th scope="col" className="px-4 py-3">Total Applied</th>
                  </tr>
                </thead>
                <tbody>
                  {currentItems.map((job) => (
                    <tr
                      key={job.internship_post_id}
                      className="border-b dark:border-gray-600 hover:bg-[#fef2e8] dark:hover:bg-gray-700"
                    >
                      <td className="w-4 px-4 py-3">
                        <div className="flex items-center">
                          <input
                            id={`checkbox-${job.internship_post_id}`}
                            type="checkbox"
                            className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                          />
                          <label
                            htmlFor={`checkbox-${job.internship_post_id}`}
                            className="sr-only"
                          >
                            checkbox
                          </label>
                        </div>
                      </td>
                      <td className="flex items-center px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        {job.job_title}
                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        {job.salary} $
                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        {job.job_duration}
                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        {job.job_type}
                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        <div className=' flex items-center'>
                          <span className={`text-xs font-medium px-3 py-0.5 rounded-full ${getStatusClass(job.status)}`}>
                            {job.status}
                          </span>
                        </div>
                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        <div className="flex items-center">
                          <Link to={`/details/job/${job.internship_post_id}`}>
                            <FaEye className="mr-3 text-amber-600" />
                          </Link>
                          <Link to={`/edit/job/${job.internship_post_id}`}>
                            <FaPenAlt className="mr-3 text-blue-600" />
                          </Link>
                          <DeleteJob jobId={job.internship_post_id} />
                        </div>
                      </td>
                      <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        <div className='pl-2 flex items-center'>
                          <Link to='/totle/application'>
                          <a href="">
                            10
                          </a>
                          </Link>
                          
                        </div>
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

export default JobTable;

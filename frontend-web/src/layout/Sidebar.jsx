import React from 'react';
import { FaBars, FaLandmark } from 'react-icons/fa';
import { FaBagShopping, FaUserGroup } from 'react-icons/fa6';
import { Link } from 'react-router-dom';

const Sidebar = () => {
  return (
    <>
<aside className="fixed top-0 left-0 z-40 w-64 h-screen pt-10 mt-10 transition-transform -translate-x-full bg-white border-r border-white md:translate-x-0 dark:bg-gray-800 dark:border-gray-700" aria-label="Sidenav" id="drawer-navigation">
    <div className="overflow-y-auto py-5 px-3 h-full bg-white dark:bg-gray-800">
      <form action="#" method="GET" className="md:hidden mb-2">
        <label htmlFor="sidebar-search" className="sr-only">Search</label>
        <div className="relative">
          <div className="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
            <svg className="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path fillRule="evenodd" clipRule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" />
            </svg>
          </div>
          <input type="text" name="search" id="sidebar-search" className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Search" />
        </div>
      </form>
      <ul className="space-y-2">

      <li>
          <Link to='/'>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg dark:text-white hover:bg-[#fce0c9] dark:hover:bg-gray-700 group">
          <svg className="w-6 h-6"  fill="grey" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
          </svg>
            <span className="ml-3">
             Dashboard       </span>
          </a>
          </Link>
        </li>

        <li>
          <Link to='/job/table'>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg dark:text-white hover:bg-[#fce0c9] dark:hover:bg-gray-700 group">
            <FaBagShopping  className='w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-[#F27C1C] dark:group-hover:text-white'></FaBagShopping>
            <span className="ml-3">
            Jobs          </span>
          </a>
          </Link>
        </li>


        <li>
          <Link to='/all/application/apply'>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg dark:text-white hover:bg-[#fce0c9] dark:hover:bg-gray-700 group">
            <FaUserGroup  className='w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-[#F27C1C] dark:group-hover:text-white'></FaUserGroup>
            <span className="ml-3">
             Candidates         </span>
          </a>
          </Link>
        </li>


       
      
      </ul>


      <ul className="pt-5 mt-5 space-y-2 border-t border-gray-200 dark:border-gray-700">
      <li>
          <Link to='/company/profile'>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg dark:text-white hover:bg-[#fce0c9] dark:hover:bg-gray-700 group">
            <FaLandmark  className='w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-[#F27C1C] dark:group-hover:text-white'></FaLandmark>
            <span className="ml-3">
             Company          </span>
            
          </a>
          </Link>
        </li>
      </ul>
    </div>
   
  </aside>
    </>
  )
}

export default Sidebar
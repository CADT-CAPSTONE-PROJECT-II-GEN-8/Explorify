import { useState } from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
    const [isOpen, setIsOpen] = useState(false);

    const toggleMenu = () => {
        setIsOpen(!isOpen);
    };

    return (
        <nav className="fixed top-0 left-0 w-full bg-white border-gray-200 py-4 dark:bg-gray-900 z-50">
            <div className="flex flex-wrap items-center justify-between max-w-screen-xl px-4 mx-auto">
                <a href="#" className="flex items-center">
                    <img
                        src="../assets/logo1.png"
                        className="h-10 w-12 mr-1 sm:h-9"
                        alt="Logo"
                    />
                    <span className="self-center text-3xl font-semibold whitespace-nowrap dark:text-white">
                        <span className='text-[#F27C1C]'>Ex</span>porify
                    </span>
                </a>
                <div className="flex items-center lg:order-2">
                    <div className="hidden lg:flex items-center">
                        <Link
                            to="/login"
                            className="text-gray-700 dark:text-white font-medium rounded-lg text-md px-4 mr-2 hover:text-[#F27C1C] focus:outline-none"
                        >
                            Log in
                        </Link>
                        <Link
                            to="/register"
                            className="text-white bg-[#F27C1C] hover:bg-[#ce6918] focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-md px-4 lg:px-5 py-2 lg:py-2.5 mr-2 lg:mr-0 dark:bg-purple-600 dark:hover:bg-purple-700 focus:outline-none dark:focus:ring-purple-800"
                        >
                            Register
                        </Link>
                    </div>
                    <button
                        type="button"
                        className="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                        aria-controls="mobile-menu"
                        aria-expanded={isOpen}
                        onClick={toggleMenu}
                    >
                        <span className="sr-only">Open main menu</span>
                        <svg
                            className={`${isOpen ? 'hidden' : 'block'} w-6 h-6`}
                            fill="currentColor"
                            viewBox="0 0 20 20"
                            xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                fillRule="evenodd"
                                d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                                clipRule="evenodd"
                            />
                        </svg>
                        <svg
                            className={`${isOpen ? 'block' : 'hidden'} w-6 h-6`}
                            fill="currentColor"
                            viewBox="0 0 20 20"
                            xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                fillRule="evenodd"
                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                clipRule="evenodd"
                            />
                        </svg>
                    </button>
                </div>
                <div
                    className={`${isOpen ? 'block' : 'hidden'} items-center justify-between w-full lg:flex lg:w-auto lg:order-1`}
                    id="mobile-menu"
                >
                    <ul className="flex flex-col mt-6 pt-2 font-medium text-md lg:flex-row lg:space-x-8 lg:mt-0">
                        <li>
                            <Link
                                to="/homePage"
                                className="block py-2 pl-3 pr-4 text-white bg-[#F27C1C] rounded lg:bg-transparent lg:text-[#F27C1C] lg:p-0 dark:text-white"
                                aria-current="page"
                            >
                                Home
                            </Link>
                        </li>

                        <li>
                            <Link
                                to="/aboutUs"
                                className="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-[#F27C1C] lg:p-0"
                            >
                                About Us
                            </Link>
                        </li>

                        <li>
                            <Link
                                to="/Features"
                                className="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-[#F27C1C] lg:p-0"
                            >
                                Features
                            </Link>
                        </li>
                        <li>
                            <Link
                                to="/Offers"
                                className="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-[#F27C1C] lg:p-0"
                            >
                                Offers
                            </Link>
                        </li>
                        <li>
                            <Link
                                to="/contactUs"
                                className="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-[#F27C1C] lg:p-0"
                            >
                                Contact
                            </Link>
                        </li>
                        <li className="lg:hidden">
                            <Link
                                to="/register"
                                className="block py-2 pl-3 pr-4 text-gray-700 dark:text-white font-medium rounded-lg text-xl hover:text-[#F27C1C] focus:outline-none"
                            >
                                Register
                            </Link>
                        </li>
                        <li className="lg:hidden">
                            <a
                                href="https://themesberg.com/product/tailwind-css/landing-page"
                                className="block py-2 pl-3 pr-4 text-white bg-[#F27C1C] hover:bg-[#ce6918] focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-md focus:outline-none"
                            >
                                Login
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    );
};

export default Navbar;

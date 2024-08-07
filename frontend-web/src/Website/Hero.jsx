import 'aos/dist/aos.css'; // Remove if not needed for other parts of the project
import { motion } from 'framer-motion';
import { useEffect } from 'react';

const Hero = () => {
    useEffect(() => {
        // AOS.init({
        //     duration: 1000,
        //     once: true,
        // });
    }, []);

    return (
        <>
            <section className="bg-gradient-to-b from-[#f7ac70] via-[#F27C1C] to-[#F27C1C] dark:bg-gray-900 relative overflow-hidden lg:pt-16 lg:pb-12">
                <div className="grid max-w-screen-xl px-4 py-8 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12 relative z-10">
                    <div className="mr-auto place-self-center lg:col-span-7">
                        {/* Text Section */}
                        <motion.div
                            initial={{ opacity: 0, x: -50 }}
                            whileInView={{ opacity: 1, x: 0 }}
                            transition={{ duration: 1 }}
                            viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                        >
                            <h1 className="max-w-2xl mb-4 text-4xl font-extrabold leading-none md:text-5xl xl:text-5xl text-white">
                                Find Your Dream Intern Program Here
                            </h1>
                            <p className="max-w-2xl mb-6 font-light text-gray-100 lg:mb-8 md:text-lg lg:text-md">
                                Explorify connects you with tailored internship opportunities, making your job search easier and more efficient.
                            </p>
                            <div className="flex flex-wrap gap-4">
                                <button className="bg-white inline-flex items-center justify-center px-5 py-3 text-base font-medium text-[#F27C1C] rounded-lg shadow-md hover:bg-[#ce6918] hover:text-white transition-all duration-300">
                                    Get started
                                    <svg className="w-5 h-5 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fillRule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clipRule="evenodd" />
                                    </svg>
                                </button>
                                <button className="bg-white flex items-center justify-center px-5 py-3 text-base font-medium rounded-lg shadow-md hover:bg-[#F27C1C] hover:text-white transition-all duration-300">
                                    <svg className="w-6 h-6" xmlns="http://www.w3.org/2000/svg" width="436.057" height="469.847" viewBox="0 0 436.057 469.847">
                                        <g transform="translate(-16.896)">
                                            <path d="M270.336,234.965,34.39,462.165A40.146,40.146,0,0,1,16.9,428.672V41.258A40.146,40.146,0,0,1,34.39,7.765Z" fill="#2196f3" />
                                            <path d="M352.9,155.6l-82.56,79.36L34.39,7.765a31.446,31.446,0,0,1,2.773-1.92A40.363,40.363,0,0,1,77.91,5.2Z" fill="#4caf50" />
                                            <path d="M452.95,234.965a40.791,40.791,0,0,1-21.333,36.267L352.9,314.325l-82.56-79.36L352.9,155.6l78.72,43.093A40.791,40.791,0,0,1,452.95,234.965Z" fill="#ffc107" />
                                            <path d="M352.9,314.325,77.91,464.725a40.9,40.9,0,0,1-40.747-.64,31.44,31.44,0,0,1-2.773-1.92l235.947-227.2Z" fill="#f44336" />
                                        </g>
                                    </svg>
                                    <div className="ml-4 text-left">
                                        <p className="text-xs text-gray-600">Download it from</p>
                                        <p className="text-xs font-semibold text-[#F27C1C]">Google Play</p>
                                    </div>
                                </button>
                            </div>
                        </motion.div>
                    </div>
                    {/* Phone Image */}
                    <motion.div
                        initial={{ opacity: 0, x: 50, scale: 0.8, rotate: 5 }}
                        whileInView={{ opacity: 1, x: 0, scale: 1, rotate: 0 }}
                        transition={{ duration: 1 }}
                        viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                        className="lg:col-span-5 flex justify-center lg:justify-end lg:absolute lg:right-0 lg:top-0 lg:inset-auto lg:z-0"
                    >
                        <img className="w-full max-w-sm md:max-w-lg lg:max-w-50" src="../assets/phone.png" alt="Phone mockup" />
                    </motion.div>
                </div>
                <div className="pt-24"></div>
                <svg
                    className="absolute bottom-0 left-0 w-full z-0"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 1440 320"
                >
                    <path
                        fill="#fff"
                        fillOpacity="1"
                        d="M0,0L40,42.7C80,85,160,171,240,197.3C320,224,400,192,480,154.7C560,117,640,75,720,74.7C800,75,880,117,960,154.7C1040,192,1120,224,1200,213.3C1280,203,1360,149,1400,122.7L1440,96L1440,320L1400,320C1360,320,1280,320,1200,320C1120,320,1040,320,960,320C880,320,800,320,720,320C640,320,560,320,480,320C400,320,320,320,240,320C160,320,80,320,40,320L0,320Z"
                    ></path>
                </svg>
            </section>
        </>
    );
};

export default Hero;

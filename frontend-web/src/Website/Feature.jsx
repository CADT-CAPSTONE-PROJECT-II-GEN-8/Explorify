import { motion } from 'framer-motion';

const Feature = () => {
    return (
        <>
            {/*  Feature 👇👇🛑🛑  */}
            <section className="relative">
                {/* Top half with white background */}
                <div className="absolute inset-0 bg-white h-1/2"></div>
                {/* Bottom half with orange background */}
                <div className="absolute bottom-0 inset-x-0 h-1/2 bg-[#ff9239]"></div>

                <div className="relative items-center w-full px-5 py-24 mx-auto md:px-12 lg:px-6 max-w-7xl ">
                    <div className="grid items-center grid-cols-1 gap-12 text-left lg:gap-2 md:grid-cols-2 lg:grid-cols-3">

                        <div className="relative items-center gap-12 m-auto lg:inline-flex md:order-first">
                            <div className="mx-auto lg:max-w-7xl">
                                <ul role="list" className="grid grid-cols-2 gap-4 list-none lg:grid-cols-1 lg:gap-6">
                                    <li>
                                        <motion.div
                                            initial={{ opacity: 0, y: 20 }}
                                            whileInView={{ opacity: 1, y: 0 }}
                                            transition={{ duration: 1 }}
                                            viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                                        >
                                            <div className="flex flex-col lg:items-end lg:text-right lg:pt-8">
                                                <div className="flex items-center justify-center h-12 w-12 rounded-md bg-[#fde0c9] text-[#F27C1C]">
                                                    <span className="text-xl font-bold">1</span>
                                                </div>
                                                <div className="mt-5">
                                                    <h3 className="text-lg font-medium text-gray-900">View Job Listing</h3>
                                                    <p className="mt-2 text-base text-gray-500">
                                                    Stay updated with the latest postings and find the right match for your career aspirations
                                                    </p>
                                                </div>
                                            </div>
                                        </motion.div>
                                    </li>
                                    <li>
                                        <motion.div
                                            initial={{ opacity: 0, y: 20 }}
                                            whileInView={{ opacity: 1, y: 0 }}
                                            transition={{ duration: 1 }}
                                            viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                                        >
                                            <div className="flex flex-col lg:items-end lg:text-right ">
                                                <div className="flex items-center justify-center h-12 w-12 rounded-md bg-white text-[#F27C1C]">
                                                    <span className="text-xl font-bold">3</span>
                                                </div>
                                                <div className="mt-5">
                                                    <h3 className="text-lg font-medium text-white">Generate Resume</h3>
                                                    <p className="mt-2 text-base text-gray-100">
                                                    Customize your resume to highlight your skills, experiences, and qualifications, ensuring you stand out to potential employers.
                                                    </p>
                                                </div>
                                            </div>
                                        </motion.div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                      
                        <motion.div
                            initial={{ opacity: 0, y: 20 }}
                            whileInView={{ opacity: 1, y: 0 }}
                            transition={{ duration: 1 }}
                            viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                            className="order-first block w-full aspect-square lg:mt-0 lg:w-full lg:h-full "
                        >
                            <img className="object-cover object-center lg:w-4/5 lg:h-full w-full h-full mx-auto lg:ml-auto" alt="hero" 
                            src="../assets/photo4.png"  />
                        </motion.div>

                        <div className="relative items-center gap-12 m-auto lg:inline-flex md:order-first">
                            <div className="mx-auto lg:max-w-7xl">
                                <ul role="list" className="grid grid-cols-2 gap-4 list-none lg:grid-cols-1 lg:gap-6">
                                    <li>
                                        <motion.div
                                            initial={{ opacity: 0, y: 20 }}
                                            whileInView={{ opacity: 1, y: 0 }}
                                            transition={{ duration: 1 }}
                                            viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                                        >
                                            <div>
                                                <div className="flex items-center justify-center h-12 w-12 rounded-md bg-[#fde0c9] text-[#F27C1C]">
                                                    <span className="text-xl font-bold">2</span>
                                                </div>
                                                <div className="mt-5">
                                                    <h3 className="text-lg font-medium text-gray-900">View Article List</h3>
                                                    <p className="mt-2 text-base text-gray-500"> Explore a collection of insightful articles designed to guide you through your internship journey.</p>
                                                </div>
                                            </div>
                                        </motion.div>
                                    </li>
                                    <li>
                                        <motion.div
                                            initial={{ opacity: 0, y: 20 }}
                                            whileInView={{ opacity: 1, y: 0 }}
                                            transition={{ duration: 1 }}
                                            viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                                        >
                                            <div >
                                                <div className="flex items-center justify-center h-12 w-12 rounded-md bg-white text-[#F27C1C]">
                                                    <span className="text-xl font-bold">4</span>
                                                </div>
                                                <div className="mt-5">
                                                    <h3 className="text-lg font-medium text-white">Recommended Course</h3>
                                                    <p className="mt-2 text-base text-gray-100">Enhance your skills and knowledge with courses recommended based on your career goals.</p>
                                                </div>
                                            </div>
                                        </motion.div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </>
    )
}

export default Feature;

import { faChartBar, faClipboardCheck, faClipboardList } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { motion } from 'framer-motion';

export const Feature1 = () => {
    return (
        <>
            <section class="pt-24 white sm:pt-16">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    transition={{ duration: 1 }}
                    viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                >
                    <div class="bg-white">
                        <div class="relative mx-auto mt-4 md:mt-8 items-center">
                            <div class="flex justify-center lg:max-w-4xl lg:mx-auto">
                                <img class="px-4 md:px-8 max-w-full h-auto" src="../assets/photo5.png" />
                            </div>
                        </div>
                    </div>
                    </motion.div>

                    <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    transition={{ duration: 1 }}
                    viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
                >
                    <section id="new-features" className="py-8 bg-white sm:py-10 lg:py-16">
                        <div className="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
                            <div className="grid grid-cols-1 gap-y-12 text-center sm:grid-cols-2 sm:gap-x-12 md:grid-cols-3 md:gap-0">

                                {/* Feature 1 */}
                                <div className="p-6 md:p-8 lg:p-14 flex flex-col justify-center items-center">
                                    <div className="w-14 h-14 rounded-full bg-[#f27c1c] flex justify-center items-center">
                                        <FontAwesomeIcon icon={faChartBar} className="text-3xl text-white" />
                                    </div>
                                    <h3 className="mt-8 text-lg sm:text-xl font-bold text-gray-900">Dashboard</h3>
                                    <p className="mt-4 text-base sm:text-sm md:text-base text-gray-600">Summary the internship post and internship application in one place.</p>
                                </div>

                                {/* Feature 2 */}
                                <div className="p-6 md:p-8 lg:p-14 flex flex-col justify-center items-center">
                                    <div className="w-14 h-14 rounded-full bg-[#f27c1c] flex justify-center items-center">
                                        <FontAwesomeIcon icon={faClipboardList} className="text-3xl text-white" />
                                    </div>
                                    <h3 className="mt-10 text-lg sm:text-xl font-bold text-gray-900">Internship Post Management</h3>
                                    <p className="mt-4 text-base sm:text-sm md:text-base text-gray-600">Manage the internship information to seek for talent candidates.</p>
                                </div>

                                {/* Feature 3 */}
                                <div className="p-6 md:p-8 lg:p-14 flex flex-col justify-center items-center">
                                    <div className="w-14 h-14 rounded-full bg-[#f27c1c] flex justify-center items-center">
                                        <FontAwesomeIcon icon={faClipboardCheck} className="text-3xl text-white" />
                                    </div>
                                    <h3 className="mt-10 text-lg sm:text-xl font-bold text-gray-900">Application Management</h3>
                                    <p className="mt-4 text-base sm:text-sm md:text-base text-gray-600">Manage the Application received from the talents in our application.</p>
                                </div>
                            </div>
                        </div>
                    </section>

                   </motion.div>
               





            </section>


        </>
    )
}

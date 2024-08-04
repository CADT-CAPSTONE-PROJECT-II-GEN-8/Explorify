
export const Contact = () => {
    return (

        <>

            <section className="bg-white body-font relative">
            <h2
                    class="font-heading mb-4 font-bold  text-center tracking-tight text-gray-900 dark:text-white text-2xl sm:text-5xl">
                    Get in Touch
                </h2>
                <div className="container lg:py-12 px-5 pb-12 pt-4 mx-auto flex sm:flex-nowrap flex-wrap ">
                    {/* for display form  */}
                    {/* <div>  <img
                        src="../assets/overlay.png"
                        alt=""
                        className="w-1000 h-1000 object-cover"
                    /></div> */}
                  
                    <div className="lg:w-1/3 md:w-1/2 md:pb-4  bg-white flex flex-col md:ml-auto w-full md:py-8 mt-8 md:mt-0 lg:px-12 lg:mr-16 shadow-lg border rounded-lg  relative z-100 p-8">
                        <h2 className="text-xl  mb-1 font-bold title-font text-[#F27C1C] text-center">Contact Us </h2>
                        <div className="relative mb-4">
                            <label htmlFor="name" className="leading-7 text-sm text-gray-600">Name</label>
                            <input type="text" id="name" name="name" className="w-full bg-white rounded-lg border border-gray-300 focus:border-[#F27C1C] focus:ring-2 focus:ring-red-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />
                        </div>
                        <div className="relative mb-4">
                            <label htmlFor="email" className="leading-7 text-sm text-gray-600">Email</label>
                            <input type="email" id="email" name="email" className="w-full bg-white rounded-lg border border-gray-300 focus:border-[#F27C1C] focus:ring-2 focus:ring-red-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />
                        </div>
                        <div className="relative mb-4">
                            <label htmlFor="message" className="leading-7 text-sm text-gray-600">Message</label>
                            <textarea id="message" name="message" className="w-full bg-white rounded-lg border border-gray-300 focus:border-[#F27C1C] focus:ring-2 focus:ring-red-200 h-32 text-base outline-none text-gray-700 py-1 px-3 resize-none leading-6 transition-colors duration-200 ease-in-out" defaultValue={""} />
                        </div>
                        <div className="relative mb-4">
                            <label className="inline-flex items-center">
                                <input type="checkbox" className="form-checkbox rounded text-[#F27C1C]" />
                                <span className="ml-2 text-sm text-gray-600">I accept the <a href="#" className="text-[#F27C1C]">Term of Service</a></span>
                            </label>
                        </div>

                        <button className="text-white bg-[#F27C1C] border-0 py-2 px-6 focus:outline-none hover:bg-[#f47b17] rounded-lg text-lg">Submit</button>
                    </div>

                    {/* for display map  */}
                    <div className="lg:w-2/4 md:w-1/2 bg-gray-300 rounded-lg overflow-hidden sm:mr-10 p-10 flex items-end justify-start relative">
                        <iframe width="100%" height="100%" className="absolute inset-0" src="https://maps.google.com/maps?width=100%&height=600&hl=en&q=%C4%B0zmir+(My%20Business%20Name)&ie=UTF8&t=&z=14&iwloc=B&output=embed" style={{ filter: 'grayscale(1) contrast(1.2) opacity(0.4)' }} />
                        <div className="bg-white relative flex flex-wrap py-6 rounded shadow-md">
                            <div className="lg:w-1/2 px-6">
                                <h2 className="title-font font-semibold text-gray-900 tracking-widest text-xs">ADDRESS</h2>
                                <p className="mt-1">Photo booth tattooed prism, portland taiyaki hoodie neutra typewriter</p>
                            </div>
                            <div className="lg:w-1/2 px-6 mt-4 lg:mt-0">
                                <h2 className="title-font font-semibold text-gray-900 tracking-widest text-xs">EMAIL</h2>
                                <a className="text-[#F27C1C] leading-relaxed">example@email.com</a>
                                <h2 className="title-font font-semibold text-gray-900 tracking-widest text-xs mt-4">PHONE</h2>
                                <p className="leading-relaxed">123-456-7890</p>
                            </div>
                        </div>
                    </div>

                </div>
            </section>



        </>

    )
}

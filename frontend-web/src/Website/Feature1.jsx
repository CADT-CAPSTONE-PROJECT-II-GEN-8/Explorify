
export const Feature1 = () => {
    return (
        <>
            <section class="pt-24 white sm:pt-16">
                <div class="bg-white">
                    <div class="relative mx-auto mt-4 md:mt-8 items-center">
                        <div class="flex justify-center lg:max-w-7xl lg:mx-auto">
                            <img class="px-4 md:px-8 max-w-full h-auto" src="../assets/laptop.png" />
                        </div>
                    </div>
                </div>
<section id="new-features" className="py-8 bg-white sm:py-10 lg:py-16">
  <div className="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
    
    <div className="grid grid-cols-1 mt-10 text-center sm:mt-16 sm:grid-cols-2 sm:gap-x-12 gap-y-12 md:grid-cols-3 md:gap-0 xl:mt-24">
      {/* Feature 1 */}
      <div className="md:p-8 lg:p-14 flex flex-col justify-center items-center">
        <div className="w-14 h-14 rounded-full bg-purple-200 flex justify-center items-center">
          <i className="fa-solid fa-chart-column text-3xl text-gray-900" />
        </div>
        <h3 className="mt-12 text-xl font-bold text-gray-900">Dashboard</h3>
        <p className="mt-5 text-base text-gray-600">Summary the internship post and internship application in one place.</p>
      </div>
      {/* Feature 2 */}
      <div className="md:p-8 lg:p-14  flex flex-col justify-center items-center">
        <div className="w-14 h-14 rounded-full bg-teal-200 flex justify-center items-center">
          <i className="fa-solid fa-truck-fast text-3xl text-gray-900" />
        </div>
        <h3 className="mt-12 text-xl font-bold text-gray-900">Internship Post Management</h3>
        <p className="mt-5 text-base text-gray-600">Manage the internship information to  seek for talent candidates.</p>
      </div>
      {/* Feature 3 */}
      <div className="md:p-8 lg:p-14  flex flex-col justify-center items-center">
        <div className="w-14 h-14 rounded-full bg-yellow-200 flex justify-center items-center">
          <i className="fa-solid fa-shield text-3xl text-gray-900" />
        </div>
        <h3 className="mt-12 text-xl font-bold text-gray-900">Internship Application Management</h3>
        <p className="mt-5 text-base text-gray-600">Manage the Application receive from the talents in our application.</p>
      </div>
 
    </div>
  </div>
</section>








            </section>


        </>
    )
}

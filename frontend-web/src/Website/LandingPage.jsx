import { Contact } from './Contact'
import Feature from './Feature'
import { Feature1 } from './Feature1'
import Footter from './Footer'
import Hero from './Hero'
import Navbar from './Navber'

const LandingPage = () => {
  return (
    <div  className="bg-white">
      <Navbar />
      <div className='pt-16'></div>
      <Hero />
      <h2 class="text-center font-display text-3xl font-bold tracking-tight text-slate-900 md:text-4xl">
        Our Features
      </h2>
      <Feature />
      <div className='pb-6'></div>
      <Feature1/>
      <Contact />
      <Footter />
    </div>
  )
}

export default LandingPage
import React from 'react'
import Navbar from './Navber'
import Footter from './Footer'
import Hero from './Hero'
import { Contact } from './Contact'

const LandingPage = () => {
  return (
    <div >
        <Navbar/>
        <div className='pt-16'></div>
        <Hero/>
        <Contact/>
        <Footter/>
    </div>
  )
}

export default LandingPage
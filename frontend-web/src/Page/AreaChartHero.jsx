// import { AreaChart } from '@tremor/react';
// import React, { useEffect, useState } from 'react';
// import axios from 'axios';

// const AreaChartHero = () => {
//   const [chartData, setChartData] = useState([]);
//   const token = localStorage.getItem('authToken'); // Or wherever you store your token

//   useEffect(() => {
//     // Fetch the data from your Django API
//     axios.get('internship/count-by-date/', {
//     })
//     .then(response => {
//       // Format the response data for the chart
//       const formattedData = response.data.dates.map((date, index) => ({
//         date: date,
//         Applied: response.data.counts[index], // Assuming you're tracking 'Applied' count
//         Hired: 0, // Replace or remove this if 'Hired' data is irrelevant
//       }));
//       setChartData(formattedData);
//     })
//     .catch(error => {
//       console.error('Error fetching chart data:', error);
//     });
//   }, []);

//   const dataFormatter = (number) => {
//     return `$${Intl.NumberFormat('us').format(number).toString()}`;
//   };

//   return (
//     <div className="p-8 space-y-12 bg-white rounded-lg shadow-md">
//       <div className="flex items-center justify-between">
//         <div className="flex items-center space-x-3">
//           <span className="text-gray-500">All investments</span>
//           <div className="text-xs px-2 py-1 text-indigo-800 bg-indigo-100 rounded-full">3 ETF</div>
//         </div>
//         <div className="flex items-center space-x-2">
//           <span className="text-xs text-gray-500">Aug 1, 2023 - Oct 15, 2023</span>
//           <span className="text-xs text-gray-500">Daily</span>
//         </div>
//       </div>

//       <div className="h-80">
//         <AreaChart
//           data={chartData}
//           index="date"
//           categories={['Applied', 'Hired']}  // Adjust if you have different categories
//           colors={['red', 'amber']}
//           valueFormatter={dataFormatter}
//           yAxisWidth={60}
//           lineWidth={2} // Adjust this value to make the line thicker
//           onValueChange={(v) => console.log(v)}
//         />
//       </div>
      
//     </div>
//   );
// };
// export default AreaChartHero;

import React , { useState, useEffect }  from "react";
import axiosInstance from "src/utils/axiosInstance";
import { AreaChart } from "@tremor/react";

const API_URL = 'internship/count-by-date/';

const dataFormatter = (number) => `${Intl.NumberFormat('us').format(number).toString()}`;

const AreaChartHero = () => {
 const [chartData, setChartData] = useState(0);

 useEffect(() => {
   // Fetch the data from your API
   axiosInstance.get(API_URL)
     .then(response => {
       // Transform the API data to match the chart data format
       const formattedData = response.data.map(item => ({
         date: new Date(item.date).toLocaleDateString('en-US', { month: 'short', day: '2-digit' }),
         Internship_posted: item.count, // You may adjust this key based on your API response
       }));
       setChartData(formattedData);
     })
     .catch(error => {
       console.error('Error fetching data:', error);
     });
 }, []);

 return (
   <div className="p-8 space-y-12 bg-white rounded-lg shadow-md">
     <div className="flex items-center justify-between">
       <div className="flex items-center space-x-3">
         <span className="text-gray-500">All internships</span>
         <div className="text-xs px-2 py-1 text-indigo-800 bg-indigo-100 rounded-full">Internship Counts</div>
       </div>
       <div className="flex items-center space-x-2">
         <span className="text-xs text-gray-500">Date Range</span>
         <span className="text-xs text-gray-500">Daily</span>
       </div>
     </div>

     <div className="h-80">
       <AreaChart
         data={chartData}
         index="date"
         categories={['Internship_posted']}
         colors={['blue']}
         valueFormatter={dataFormatter}
         yAxisWidth={60}
         lineWidth={2} // Adjust this value to make the line thicker
         onValueChange={(v) => console.log(v)}
       />
     </div>
   </div>
 );
};

export default AreaChartHero;

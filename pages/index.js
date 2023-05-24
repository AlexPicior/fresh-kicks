import React, {useState, useEffect} from 'react'
import { Banner, BestShoesSection, NewShoesSection} from '../components'

export const Home = () => {
  
  const [products, setProducts] = useState(null);
  useEffect(() =>{
    fetch('https://fresh-kicks-server.herokuapp.com/api/products')
    .then(response => response.json())
    .then(json =>{ 
      setProducts(json);
    });
  }, []);
  

  return (
    <div>
      <Banner />
      
      <BestShoesSection />

      {products && <NewShoesSection products = {products}/>}
    </div>
  )
}
/*
export const getServerSideProps = async () =>{
  let products = [];
  fetch('https://fresh-kicks-server.herokuapp.com/api/products')
  .then(response => response.json())
  .then(json => {
    products = [...json];
  });

  return {
    props: { products }
  }
}
*/
export default Home
import React from 'react'
import { ProductDetailsSection, YouMayAlsoLikeSection} from '../../components'

function ProductDetails({product, similarProducts}) {
  return (
    <div>
      <ProductDetailsSection product = {product} />
      <YouMayAlsoLikeSection similarProducts = {similarProducts} />
    </div>
  )
}

export const getStaticPaths = async () => {
  let products = [];
  fetch(`http://localhost:3000/api/products`)
  .then(response => response.json())
  .then(json =>{ 
    products = [...json];
  });

  const paths = products.map((product) => ({
      params: {
        slug: product.slug
      }
    }));

  return {
    paths,
    fallback: 'blocking'
  }
}

export const getStaticProps = async ({params:{slug}}) => {
  const getProductRes = await fetch(`http://localhost:3000/api/products/${slug}`);
  const product = await getProductRes.json();

  const getSimilarProductsRes = await fetch(`http://localhost:3000/api/products/${product.slug}/${product.brand}`);
  let similarProducts = await getSimilarProductsRes.json();
  similarProducts = similarProducts.slice(-7);

  return {
    props: { product, similarProducts}
  }
}


export default ProductDetails
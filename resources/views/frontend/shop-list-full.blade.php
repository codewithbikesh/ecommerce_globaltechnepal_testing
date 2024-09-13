@extends('frontend.layouts.master')
@section('content')
<!--====== App Content ======-->
<div class="app-content">

    <!--====== Section 1 ======-->
    <div class="u-s-p-y-90">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop-p">
                        <div class="shop-p__toolbar u-s-m-b-30">
                            <div class="shop-p__meta-wrap u-s-m-b-60">
                                <span>You Searched For:</span>
                                <a class="gl-tag btn--e-brand-shadow" href="#">chaddi banyan</a>
                                <div class="shop-p__meta-text-2 d-flex justify-content-between">
                                    <span class="shop-p__meta-text-1">FOUND 18 RESULTS</span>
                                    <button class="fltrBtn Productoption quickViewBtnHompepage" style="font-size: 2rem; color: white; ">Filter</button>

                                </div>
                            </div>
                            <!-- <div class="shop-p__tool-style">
                                    <div class="tool-style__group u-s-m-b-8">
    
                                        <span class="js-shop-filter-target" data-side="#side-filter">Filters</span>
    
                                        <span class="js-shop-grid-target">Grid</span>
    
                                        <span class="js-shop-list-target is-active">List</span>
                                    </div>
                                    <form>
                                        <div class="tool-style__form-wrap">
                                            <div class="u-s-m-b-8"><select class="select-box select-box--transparent-b-2">
                                                    <option>Show: 8</option>
                                                    <option selected>Show: 12</option>
                                                    <option>Show: 16</option>
                                                    <option>Show: 28</option>
                                                </select></div>
                                            <div class="u-s-m-b-8"><select class="select-box select-box--transparent-b-2">
                                                    <option selected>Sort By: Newest Items</option>
                                                    <option>Sort By: Latest Items</option>
                                                    <option>Sort By: Best Selling</option>
                                                    <option>Sort By: Best Rating</option>
                                                    <option>Sort By: Lowest Price</option>
                                                    <option>Sort By: Highest Price</option>
                                                </select></div>
                                        </div>
                                    </form>
                                </div> -->
                        </div>

                        <!-- ALL PRODUCT BOXES  -->

                        <div class="shop-p__collection productParentParent">
                            <div class="ssllll">
                                <div class="shop-a" id="side-filter">
                                    <div class="shop-a__wrap">
                                        <div class="shop-a__inner gl-scroll">
                                            <div class="shop-w-master">
                                                <h1 class="shop-w-master__heading u-s-m-b-30"><i
                                                        class="fas fa-filter u-s-m-r-8"></i>

                                                    <span>FILTERS</span>

                                                </h1>
                                                <div class="shop-w-master__sidebar">
                                                    <div class="u-s-m-b-30">
                                                        <div class="shop-w">
                                                            <div class="shop-w__intro-wrap">
                                                                <h1 class="shop-w__h">CATEGORY</h1>

                                                                <span class="fas fa-minus shop-w__toggle"
                                                                    data-target="#s-category"
                                                                    data-toggle="collapse"></span>
                                                            </div>
                                                            <div class="shop-w__wrap collapse show" id="s-category">
                                                                <ul class="shop-w__category-list gl-scroll">
                                                                    <li class="has-list mainCategory">

                                                                        <a href="#"
                                                                            class="hedingCategory">Electronics</a>

                                                                        <span
                                                                            class="category-list__text u-s-m-l-6">(23)</span>

                                                                        <span
                                                                            class="js-shop-category-span is-expanded fas fa-plus u-s-m-l-6"></span>
                                                                        <ul style="display:block">
                                                                            <li class="has-list">

                                                                                <a href="#">3D Printer & Supplies</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">3d Printer</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">3d Printing Pen</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">3d Printing
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">3d Printer Module
                                                                                            Board</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Home Audio & Video</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">TV Boxes</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">TV Receiver &
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">3d Printing
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">3d Printer Module
                                                                                            Board</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Media Players</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Earphones</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Mp3 Players</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Speakers &
                                                                                            Radios</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Microphones</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Video Game Accessories</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Nintendo Video Games
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Sony Video Games
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Xbox Video Games
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Security & Protection</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Security Cameras</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Alarm System</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Security Gadgets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">CCTV Security
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Home Audio & Video</a>

                                                                                <span
                                                                                    class="js-shop-category-span is-expanded fas fa-plus u-s-m-l-6"></span>
                                                                                <ul style="display:block">
                                                                                    <li>

                                                                                        <a href="#">TV Boxes</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">TV Receiver &
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">3d Printing
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">3d Printer Module
                                                                                            Board</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Photography & Camera</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Digital Cameras</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Sport Camera &
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Camera
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Lenses &
                                                                                            Accessories</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Arduino Compatible</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Raspberry Pi &
                                                                                            Orange Pi</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Module Board</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Smart Robot</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Board Kits</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">DSLR Camera</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Nikon Camera</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Canon Camera</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Sony Camera</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">DSLR Lenses</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Necessary Accessories</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Flash Cards</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Memory Cards</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Flash Pins</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Compact Discs</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li class="has-list mainCategory">

                                                                        <a href="#" class="hedingCategory">Women's
                                                                            Clothing</a>

                                                                        <span
                                                                            class="category-list__text u-s-m-l-6">(5)</span>

                                                                        <span
                                                                            class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                        <ul>
                                                                            <li class="has-list">

                                                                                <a href="#">Hot Categories</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Dresses</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Blouses & Shirts</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">T-shirts</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Rompers</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Intimates</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Bras</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Brief Sets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Bustiers &
                                                                                            Corsets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Panties</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Wedding & Events</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Wedding Dresses</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Evening Dresses</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Prom Dresses</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Flower Dresses</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Bottoms</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Skirts</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Shorts</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Leggings</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Jeans</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Outwear</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Blazers</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Basic Jackets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Trench</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Leather & Suede</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Jackets</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Denim Jackets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Trucker Jackets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Windbreaker
                                                                                            Jackets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Leather Jackets</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Accessories</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Tech Accessories</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Headwear</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Baseball Caps</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Belts</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Other Accessories</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Bags</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Wallets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Watches</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Sunglasses</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li class="has-list mainCategory">

                                                                        <a href="#" class="hedingCategory">Men's
                                                                            Clothing</a>

                                                                        <span
                                                                            class="category-list__text u-s-m-l-6">(5)</span>

                                                                        <span
                                                                            class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                        <ul>
                                                                            <li class="has-list">

                                                                                <a href="#">Hot Sale</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">T-Shirts</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Tank Tops</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Polo</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Shirts</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Outwear</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Hoodies</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Trench</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Parkas</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Sweaters</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Bottoms</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Casual Pants</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Cargo Pants</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Jeans</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Shorts</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Underwear</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Boxers</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Briefs</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Robes</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Socks</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Jackets</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Denim Jackets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Trucker Jackets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Windbreaker
                                                                                            Jackets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Leather Jackets</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Sunglasses</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Pilot</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Wayfarer</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Square</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Round</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Accessories</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Eyewear Frames</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Scarves</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Hats</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Belts</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                            <li class="has-list">

                                                                                <a href="#">Other Accessories</a>

                                                                                <span
                                                                                    class="js-shop-category-span fas fa-plus u-s-m-l-6"></span>
                                                                                <ul>
                                                                                    <li>

                                                                                        <a href="#">Bags</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Wallets</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Watches</a>
                                                                                    </li>
                                                                                    <li>

                                                                                        <a href="#">Tech Accessories</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li>

                                                                        <a href="#">Food & Supplies</a>

                                                                        <span
                                                                            class="category-list__text u-s-m-l-6">(0)</span>
                                                                    </li>
                                                                    <li>

                                                                        <a href="#">Furniture & Decor</a>

                                                                        <span
                                                                            class="category-list__text u-s-m-l-6">(0)</span>
                                                                    </li>
                                                                    <li>

                                                                        <a href="#">Sports & Game</a>

                                                                        <span
                                                                            class="category-list__text u-s-m-l-6">(0)</span>
                                                                    </li>
                                                                    <li>

                                                                        <a href="#">Beauty & Health</a>

                                                                        <span
                                                                            class="category-list__text u-s-m-l-6">(0)</span>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="u-s-m-b-30">
                                                        <div class="shop-w">
                                                            <div class="shop-w__intro-wrap">
                                                                <h1 class="shop-w__h">PRICE</h1>

                                                                <span class="fas fa-minus shop-w__toggle"
                                                                    data-target="#s-price"
                                                                    data-toggle="collapse"></span>
                                                            </div>
                                                            <div class="shop-w__wrap collapse show" id="s-price">
                                                                <form class="shop-w__form-p">
                                                                    <div class="shop-w__form-p-wrap">
                                                                        <div>

                                                                            <label for="price-min"></label>

                                                                            <input
                                                                                class="input-text input-text--primary-style"
                                                                                type="text" id="price-min"
                                                                                placeholder="Min">
                                                                        </div>
                                                                        <div>

                                                                            <label for="price-max"></label>

                                                                            <input
                                                                                class="input-text input-text--primary-style"
                                                                                type="text" id="price-max"
                                                                                placeholder="Max">
                                                                        </div>
                                                                        <div>

                                                                            <button
                                                                                class="btn btn--icon fas fa-angle-right btn--e-transparent-platinum-b-2"
                                                                                type="submit"></button>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="u-s-m-b-30">
                                                        <div class="shop-w">
                                                            <div class="shop-w__intro-wrap">
                                                                <h1 class="shop-w__h">MANUFACTURER</h1>

                                                                <span class="fas fa-minus shop-w__toggle"
                                                                    data-target="#s-manufacturer"
                                                                    data-toggle="collapse"></span>
                                                            </div>
                                                            <div class="shop-w__wrap collapse show" id="s-manufacturer">
                                                                <ul class="shop-w__list-2">
                                                                    <li>
                                                                        <div class="list__content">

                                                                            <input type="checkbox" checked>

                                                                            <span>Calvin Klein</span>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(23)</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="list__content">

                                                                            <input type="checkbox">

                                                                            <span>Diesel</span>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(2)</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="list__content">

                                                                            <input type="checkbox">

                                                                            <span>Polo</span>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(2)</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="list__content">

                                                                            <input type="checkbox">

                                                                            <span>Tommy Hilfiger</span>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(9)</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="list__content">

                                                                            <input type="checkbox">

                                                                            <span>Ndoge</span>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(3)</span>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="u-s-m-b-30">
                                                        <div class="shop-w">
                                                            <div class="shop-w__intro-wrap">
                                                                <h1 class="shop-w__h">COLOR</h1>

                                                                <span class="fas fa-minus shop-w__toggle"
                                                                    data-target="#s-color"
                                                                    data-toggle="collapse"></span>
                                                            </div>
                                                            <div class="shop-w__wrap collapse show" id="s-color">
                                                                <ul class="shop-w__list gl-scroll">
                                                                    <li>
                                                                        <div class="color__check">

                                                                            <input type="checkbox" id="jet">

                                                                            <label class="color__check-label" for="jet"
                                                                                style="background-color: #333333"></label>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(2)</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="color__check">

                                                                            <input type="checkbox" id="folly">

                                                                            <label class="color__check-label"
                                                                                for="folly"
                                                                                style="background-color: #FF0055"></label>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(4)</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="color__check">

                                                                            <input type="checkbox" id="yellow">

                                                                            <label class="color__check-label"
                                                                                for="yellow"
                                                                                style="background-color: #FFFF00"></label>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(6)</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="color__check">

                                                                            <input type="checkbox" id="granite-gray">

                                                                            <label class="color__check-label"
                                                                                for="granite-gray"
                                                                                style="background-color: #605F5E"></label>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(8)</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="color__check">

                                                                            <input type="checkbox" id="space-cadet">

                                                                            <label class="color__check-label"
                                                                                for="space-cadet"
                                                                                style="background-color: #1D3461"></label>
                                                                        </div>

                                                                        <span class="shop-w__total-text">(10)</span>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="u-s-m-b-30">
                                                        <div class="shop-w">
                                                            <div class="shop-w__intro-wrap">
                                                                <h1 class="shop-w__h">SIZE</h1>

                                                                <span class="fas fa-minus collapsed shop-w__toggle"
                                                                    data-target="#s-size" data-toggle="collapse"></span>
                                                            </div>
                                                            <div class="shop-w__wrap collapse" id="s-size">
                                                                <ul class="shop-w__list gl-scroll">
                                                                    <li>

                                                                        <!--====== Check Box ======-->
                                                                        <div class="check-box">

                                                                            <input type="checkbox" id="xs">
                                                                            <div
                                                                                class="check-box__state check-box__state--primary">

                                                                                <label class="check-box__label"
                                                                                    for="xs">XS</label>
                                                                            </div>
                                                                        </div>
                                                                        <!--====== End - Check Box ======-->

                                                                        <span class="shop-w__total-text">(2)</span>
                                                                    </li>
                                                                    <li>

                                                                        <!--====== Check Box ======-->
                                                                        <div class="check-box">

                                                                            <input type="checkbox" id="small">
                                                                            <div
                                                                                class="check-box__state check-box__state--primary">

                                                                                <label class="check-box__label"
                                                                                    for="small">Small</label>
                                                                            </div>
                                                                        </div>
                                                                        <!--====== End - Check Box ======-->

                                                                        <span class="shop-w__total-text">(4)</span>
                                                                    </li>
                                                                    <li>

                                                                        <!--====== Check Box ======-->
                                                                        <div class="check-box">

                                                                            <input type="checkbox" id="medium">
                                                                            <div
                                                                                class="check-box__state check-box__state--primary">

                                                                                <label class="check-box__label"
                                                                                    for="medium">Medium</label>
                                                                            </div>
                                                                        </div>
                                                                        <!--====== End - Check Box ======-->

                                                                        <span class="shop-w__total-text">(6)</span>
                                                                    </li>
                                                                    <li>

                                                                        <!--====== Check Box ======-->
                                                                        <div class="check-box">

                                                                            <input type="checkbox" id="large">
                                                                            <div
                                                                                class="check-box__state check-box__state--primary">

                                                                                <label class="check-box__label"
                                                                                    for="large">Large</label>
                                                                            </div>
                                                                        </div>
                                                                        <!--====== End - Check Box ======-->

                                                                        <span class="shop-w__total-text">(8)</span>
                                                                    </li>
                                                                    <li>

                                                                        <!--====== Check Box ======-->
                                                                        <div class="check-box">

                                                                            <input type="checkbox" id="xl">
                                                                            <div
                                                                                class="check-box__state check-box__state--primary">

                                                                                <label class="check-box__label"
                                                                                    for="xl">XL</label>
                                                                            </div>
                                                                        </div>
                                                                        <!--====== End - Check Box ======-->

                                                                        <span class="shop-w__total-text">(10)</span>
                                                                    </li>
                                                                    <li>

                                                                        <!--====== Check Box ======-->
                                                                        <div class="check-box">

                                                                            <input type="checkbox" id="xxl">
                                                                            <div
                                                                                class="check-box__state check-box__state--primary">

                                                                                <label class="check-box__label"
                                                                                    for="xxl">XXL</label>
                                                                            </div>
                                                                        </div>
                                                                        <!--====== End - Check Box ======-->

                                                                        <span class="shop-w__total-text">(12)</span>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row productParent">
                                @if ($shoplistproducts->isNotEmpty())
                                                                                                                    @foreach ($shoplistproducts as $shoplistproduct)
                                                                                                                                                                                                                                                                                            <div class="col-lg-3 col-md-4 col-sm-6 singleProduct">
                                                                                                                                                                                                                                                                                                <div class="product-m">
                                                                                                                                                                                                                                                                                                    <div class="product-m__thumb">

                                                                                                                                                                                                                                                                                                        <a class="aspect aspect--bg-grey aspect--square u-d-block"
                                                                                                                                                                                                                                                                                                            href="{{ route('frontend.product-detail', $shoplistproduct->product_code) }}">

                                                                                                                                                                                                                                                                                                            <img class="aspect__img"
                                                                                                                                                                                                                                                                                                                src="data:image/jpeg;base64,{{ $shoplistproduct->primary_image }}"
                                                                                                                                                                                                                                                                                                                alt=""></a>


                                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                                    <div class="product-m__content d-flex justify-content-evenly flex-column">

                                                                                                                                                                                                                                                                                                        <div class="product-m__category text-center product-o__name productName">

                                                                                                                                                                                                                                                                                                            <a
                                                                                                                                                                                                                                                                                                                href="shop-side-version-2.html">{{ $shoplistproduct->category_id }}</a>
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                        <div class="product-m__name text-center product-o__name productName" >

                                                                                                                                                                                                                                                                                                            <a
                                                                                                                                                                                                                                                                                                                href="{{ route('frontend.product-detail', $shoplistproduct->product_code) }}">{{ $shoplistproduct->product_name }}</a>
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                        <div class="product-m__rating gl-rating-style"><i class="fas fa-star"></i><i
                                                                                                                                                                                                                                                                                                                class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i
                                                                                                                                                                                                                                                                                                                class="far fa-star"></i><i class="far fa-star"></i>

                                                                                                                                                                                                                                                                                                            <span class="product-m__review">(23)</span>
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                        <!-- <div class="product-m__price">{{ $shoplistproduct->sell_price }}</div> -->
                                                                                                                                                                                                                                                                                                         <div>
                                                                                                                                                                                                                                                                                                            product-m__price<span class="product-o__price">250.00 <span class="product-o__discount">300.00</span></span>
                                                                                                                                                                                                                                                                                                         </div>
                                                                                                                                                                                                                                                                                                        <div class="product-m__hover">
                                                                                                                                                                                                                                                                                                            <!-- <div class="product-m__preview-description">

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <span>Lorem Ipsum is simply dummy text of the printing and
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            typesetting industry. Lorem Ipsum has been the industry's
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            standard dummy text ever since the 1500s, when an unknown
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            printer took a galley of type and scrambled it to make a type
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            specimen book.</span>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    </div> -->

                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                    </div>


                                                                                                                                                                                                                                                                                                    <div class="prevQuickAddCart d-flex justify-content-evenly">

                                                                                                                                                                                                                                                                                                        <div class="quicklokandWishlist bg-info d-flex justify-content-evenly align-items-center"
                                                                                                                                                                                                                                                                                                            style="width:40%;">

                                                                                                                                                                                                                                                                                                            <div class="product-m__quick-look">
                                                                                                                                                                                                                                                                                                                <a class="fas fa-search" data-modal="modal"
                                                                                                                                                                                                                                                                                                                    data-modal-id="#quick-look{{ $shoplistproduct->product_code }}"
                                                                                                                                                                                                                                                                                                                    value="{{ $shoplistproduct->product_code }}"
                                                                                                                                                                                                                                                                                                                    data-tooltip="tooltip" data-placement="top" title="Quick Look"
                                                                                                                                                                                                                                                                                                                    style="color:white; font-size:1.2rem;"></a>
                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                            <div class="product-m__wishlist">
                                                                                                                                                                                                                                                                                                                <a class="far fa-heart" href="#" data-tooltip="tooltip"
                                                                                                                                                                                                                                                                                                                    data-placement="top" title="Add to Wishlist"
                                                                                                                                                                                                                                                                                                                    style="color:white; font-size:1.2rem;"></a>
                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                        <div class="product-m__add-cart Productoption addtoCartBtnHompepage"
                                                                                                                                                                                                                                                                                                            style="width:100%;">

                                                                                                                                                                                                                                                                                                            <a class="btn--e-brand" data-modal="modal"
                                                                                                                                                                                                                                                                                                                data-modal-id="#add-to-cart{{ $shoplistproduct->product_code }}"
                                                                                                                                                                                                                                                                                                                value="{{ $shoplistproduct->product_code }}">Add to Cart</a>
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                            <!-- ---------------------------------------- -->
                                                                                                                                                                                                                                                                                            <!--====== Quick Look Modal ======-->
                                                                                                                                                                                                                                                                                            <div class="modal fade" id="quick-look{{ $shoplistproduct->product_code }}">
                                                                                                                                                                                                                                                                                                <div class="modal-dialog modal-dialog-centered">
                                                                                                                                                                                                                                                                                                    <div class="modal-content modal--shadow">

                                                                                                                                                                                                                                                                                                        <button class="btn dismiss-button fas" type="button"
                                                                                                                                                                                                                                                                                                            data-dismiss="modal">X</button>
                                                                                                                                                                                                                                                                                                        <div class="modal-body">
                                                                                                                                                                                                                                                                                                            <div class="row">
                                                                                                                                                                                                                                                                                                                <div class="col-lg-5">

                                                                                                                                                                                                                                                                                                                    <!--====== End - Product Breadcrumb ======-->


                                                                                                                                                                                                                                                                                                                    <!--====== Product Detail ======-->
                                                                                                                                                                                                                                                                                                                    <div class="pd u-s-m-b-30">
                                                                                                                                                                                                                                                                                                                        <div class="pd-wrap">
                                                                                                                                                                                                                                                                                                                            <div id="js-product-detail-modal">
                                                                                                                                                                                                                                                                                                                                <div>

                                                                                                                                                                                                                                                                                                                                    <img class="u-img-fluid"
                                                                                                                                                                                                                                                                                                                                        src="data:image/jpeg;base64,{{ $shoplistproduct->primary_image }}"
                                                                                                                                                                                                                                                                                                                                        alt="">
                                                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                                        {{-- <div class="u-s-m-t-15">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div id="js-product-detail-modal-thumbnail">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <div>

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <img class="u-img-fluid"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        src="data:image/jpeg;base64,{{ $product->primary_image }}"
                                                                                                                                                                                                                                                                                                                        alt="">
                                                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                                            </div> --}}
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                        <!--====== End - Product Detail ======-->
                                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                                    <div class="col-lg-7">

                                                                                                                                                                                                                                                                                                        <!--====== Product Right Side Details ======-->
                                                                                                                                                                                                                                                                                                        <div class="pd-detail">
                                                                                                                                                                                                                                                                                                            <div>

                                                                                                                                                                                                                                                                                                                <span
                                                                                                                                                                                                                                                                                                                    class="pd-detail__name">{{ $shoplistproduct->product_name
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }}</span>
                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                            <div>
                                                                                                                                                                                                                                                                                                                <div class="pd-detail__inline">

                                                                                                                                                                                                                                                                                                                    <span class="pd-detail__price">{{
                                                                                                                            $shoplistproduct->sell_price }}</span>
                                                                                                                                                                                                                                                                                                                    @php
                                                                                                                        $actualPrice = $shoplistproduct->actual_price;
                                                                                                                        $sellPrice = $shoplistproduct->sell_price;


                                                                                                                        $discountPercentage = $actualPrice > 0
                                                                                                                            ? round(((($actualPrice - $sellPrice) /
                                                                                                                                $actualPrice) * 100), 2)
                                                                                                                            : 0;
                                                                                                                                                                                                                                                                                                                    @endphp
                                                                                                                                                                                                                                                                                                                    <span class="pd-detail__discount">({{
                                                                                                                            $discountPercentage }}%
                                                                                                                                                                                                                                                                                                                        OFF)</span><del
                                                                                                                                                                                                                                                                                                                        class="pd-detail__del">{{ $shoplistproduct->actual_price
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }}</del>
                                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                            {{-- <div class="u-s-m-b-15">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="pd-detail__rating gl-rating-style"><i
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                class="fas fa-star"></i><i
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                class="fas fa-star"></i><i
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                class="fas fa-star"></i><i
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                class="fas fa-star"></i><i
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                class="fas fa-star-half-alt"></i>

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <span class="pd-detail__review u-s-m-l-4">

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <a href="product-detail.html">23
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Reviews</a></span>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    </div> --}}
                                                                                                                                                                                                                                                                                                            <div class="u-s-m-b-15">
                                                                                                                                                                                                                                                                                                                <div class="pd-detail__inline">

                                                                                                                                                                                                                                                                                                                    <span class="pd-detail__stock">{{
                                                                                                                            $shoplistproduct->stock_quantity }}
                                                                                                                                                                                                                                                                                                                        in
                                                                                                                                                                                                                                                                                                                        stock</span>
                                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                            <div class="u-s-m-b-15">
                                                                                                                                                                                                                                                                                                                <form class="pd-detail__form" method="POST"
                                                                                                                                                                                                                                                                                                                    action="{{ route('cart.add') }}">
                                                                                                                                                                                                                                                                                                                    @csrf
                                                                                                                                                                                                                                                                                                                    <div class="pd-detail-inline-2">
                                                                                                                                                                                                                                                                                                                        <div class="u-s-m-b-15">

                                                                                                                                                                                                                                                                                                                            <!--====== Input Counter ======-->
                                                                                                                                                                                                                                                                                                                            <div class="input-counter">

                                                                                                                                                                                                                                                                                                                                <span
                                                                                                                                                                                                                                                                                                                                    class="input-counter__minus fas fa-minus"></span>

                                                                                                                                                                                                                                                                                                                                <input
                                                                                                                                                                                                                                                                                                                                    class="input-counter__text input-counter--text-primary-style"
                                                                                                                                                                                                                                                                                                                                    type="text" value="1" name="quantity"
                                                                                                                                                                                                                                                                                                                                    data-min="1" data-max="1000">

                                                                                                                                                                                                                                                                                                                                <span
                                                                                                                                                                                                                                                                                                                                    class="input-counter__plus fas fa-plus"></span>
                                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                                            <!--====== End - Input Counter ======-->
                                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                                        <div class="u-s-m-b-15 ">

                                                                                                                                                                                                                                                                                                                            <input type="hidden" name="product_code"
                                                                                                                                                                                                                                                                                                                                value="{{ $shoplistproduct->product_code }}">
                                                                                                                                                                                                                                                                                                                            <button class="btn btn--e-brand-b-2" type="submit">Add
                                                                                                                                                                                                                                                                                                                                to
                                                                                                                                                                                                                                                                                                                                Cart</button>
                                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                                                </form>
                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                        <!--====== End - Product Right Side Details ======-->
                                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                <!--====== End - Quick Look Modal ======-->

                                                                                                                                                                                                                                                                                <!--====== Add to Cart Modal ======-->
                                                                                                                                                                                                                                                                                <div class="modal fade" id="add-to-cart{{ $shoplistproduct->product_code }}">
                                                                                                                                                                                                                                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                                                                                                                                                                                                                                        <div class="modal-content modal-radius modal-shadow">

                                                                                                                                                                                                                                                                                            <button class="btn dismiss-button fas" type="button" data-dismiss="modal">X</button>
                                                                                                                                                                                                                                                                                            <div class="modal-body">

                                                                                                                                                                                                                                                                                                <form class="pd-detail__form" method="POST" action="{{ route('cart.add') }}">
                                                                                                                                                                                                                                                                                                    @csrf
                                                                                                                                                                                                                                                                                                    <div class="row">
                                                                                                                                                                                                                                                                                                        <div class="col-lg-6 col-md-12">
                                                                                                                                                                                                                                                                                                            <div class="success u-s-m-b-30">
                                                                                                                                                                                                                                                                                                                <div class="success__img-wrap">
                                                                                                                                                                                                                                                                                                                    <img class="u-img-fluid"
                                                                                                                                                                                                                                                                                                                        src="data:image/jpeg;base64,{{ $shoplistproduct->primary_image }}"
                                                                                                                                                                                                                                                                                                                        alt="">
                                                                                                                                                                                                                                                                                                                </div>

                                                                                                                                                                                                                                                                                                                <div class="success__info-wrap">

                                                                                                                                                                                                                                                                                                                    <span class="success__name">{{
                                                                                                                            $shoplistproduct->product_name }}</span>

                                                                                                                                                                                                                                                                                                                    <div class="input-counter">
                                                                                                                                                                                                                                                                                                                        <span class="input-counter__minus fas fa-minus"></span>
                                                                                                                                                                                                                                                                                                                        <input
                                                                                                                                                                                                                                                                                                                            class="input-counter__text input-counter--text-primary-style"
                                                                                                                                                                                                                                                                                                                            type="text" value="1" name="quantity" data-min="1"
                                                                                                                                                                                                                                                                                                                            data-max="1000">
                                                                                                                                                                                                                                                                                                                        <span class="input-counter__plus fas fa-plus"></span>
                                                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                                                    <span
                                                                                                                                                                                                                                                                                                                        class="success__price">{{ $shoplistproduct->sell_price
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }}</span>
                                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                        <div class="col-lg-6 col-md-12">
                                                                                                                                                                                                                                                                                                            <div class="s-option">
                                                                                                                                                                                                                                                                                                                <div class="s-option__link-box">
                                                                                                                                                                                                                                                                                                                    <a class="s-option__link btn--e-white-brand-shadow"
                                                                                                                                                                                                                                                                                                                        href="{{ route('frontend.index') }}">CONTINUE
                                                                                                                                                                                                                                                                                                                        SHOPPING</a>
                                                                                                                                                                                                                                                                                                                    <a class="s-option__link btn--e-white-brand-shadow"
                                                                                                                                                                                                                                                                                                                        href="{{ route('frontend.cart') }}">GO TO CART
                                                                                                                                                                                                                                                                                                                        PAGE</a>
                                                                                                                                                                                                                                                                                                                    <input type="hidden" name="product_code"
                                                                                                                                                                                                                                                                                                                        value="{{ $shoplistproduct->product_code }}">
                                                                                                                                                                                                                                                                                                                    <button class="s-option__link btn--e-brand-shadow "
                                                                                                                                                                                                                                                                                                                        type="submit">ADD
                                                                                                                                                                                                                                                                                                                        TO CART</button>
                                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                                </form>
                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                                                                                                                                                    </div>
                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                <!--====== End - Add to Cart Modal ======-->
                                                                                                                    @endforeach
                                @else
                                    <h1>Search No Result</h1>
                                    <p>We're sorry. We cannot find any matches for your search term.</p>
                                @endif
                </div>

            </div>
            <div class="u-s-p-y-60">
                <div style="padding: 10px">
                    {{ $shoplistproducts->links('pagination::bootstrap-5') }}
                </div>
                <!--====== Pagination ======-->
                {{-- <ul class="shop-p__pagination">
                                    <li class="is-active">
    
                                        <a href="shop-list-full.html">1</a>
                                    </li>
                                    <li>
    
                                        <a href="shop-list-full.html">2</a>
                                    </li>
                                    <li>
    
                                        <a href="shop-list-full.html">3</a>
                                    </li>
                                    <li>
    
                                        <a href="shop-list-full.html">4</a>
                                    </li>
                                    <li>
    
                                        <a class="fas fa-angle-right" href="shop-list-full.html"></a>
                                    </li>
                                </ul> --}}
                <!--====== End - Pagination ======-->
            </div>
        </div>
    </div>
</div>
</div>
</div>
<!--====== End - Section 1 ======-->
</div>
<!--====== End - App Content ======-->



<!--====== Side Filters ======-->

<!--====== End - Side Filters ======-->



@endsection
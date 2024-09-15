<div class="leftSideBar sliderHide">
    <aside class="sidebar">
        <ul class="links">
            <h4>Main Menu</h4>
            {{-- <li>
                <span class="material-symbols-outlined">dashboard</span>
                <a href="#">Dashboard</a>
            </li> --}}
            <li>
                <span class="material-symbols-outlined greycolor">show_chart</span>
                <a class="dash-active greycolor" href="{{ route('frontend.account') }}">Manage My
                    Account</a>
            </li>
              <li>
                <span class="greycolor ri-map-pin-line material-symbols-outlined greycolor"></span>
                <a class="greycolor" href="{{ route('frontend.address.book') }}">Address Book</a>
            </li>
            <li>
                <span class="greycolor material-symbols-outlined">flag</span>
                <a class="greycolor" href="{{ route('frontend.dash-my-order') }}">My Orders</a>
            </li>
            <hr>
            <h4>Advanced</h4>
            <li>
                <span class="greycolor material-symbols-outlined">person</span>
            <a class="greycolor" href="{{ route('frontend.dash-cancellation') }}">My Returns &
                Cancellations</a>
            </li>
            <li>
                <span class="greycolor material-symbols-outlined">group</span>
                <a href="#" class="greycolor">Developer </a>
            </li>
            <li>
                <span class="greycolor material-symbols-outlined">ambient_screen</span>
                <a href="#" class="greycolor">Magic Build</a>
            </li>
            <li>
                <span class="greycolor material-symbols-outlined">pacemaker</span>
                <a href="#" class="greycolor">Theme Maker</a>
            </li>
            <li>
                <span class="greycolor material-symbols-outlined">monitoring</span>
                <a href="#" class="greycolor">Analytic</a>
            </li>
            <hr>
            <h4>Account</h4>
            <li>
                <span class="greycolor material-symbols-outlined">bar_chart</span>
                <a href="#" class="greycolor">Overview</a>
            </li>
            <li>
                <span class="greycolor material-symbols-outlined">mail</span>
                <a href="#" class="greycolor">Message</a>
            </li>
            <li>
                <span class="greycolor material-symbols-outlined">settings</span>
                <a href="#" class="greycolor">Settings</a>
            </li>
        </ul>
    </aside>  
</div>

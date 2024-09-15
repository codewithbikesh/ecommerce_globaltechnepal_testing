<div class="leftSideBar sliderHide">
    <aside class="sidebar">
        <ul class="links">
            <h4>Main Menu</h4>
            {{-- <li>
                <span class="material-symbols-outlined">dashboard</span>
                <a href="#">Dashboard</a>
            </li> --}}
            <li>
                <span class="material-symbols-outlined fa">show_chart</span>
                <a class="dash-active fa" href="{{ route('frontend.account') }}">Manage My
                    Account</a>
            </li>
              <li>
                <span class="fa ri-map-pin-line material-symbols-outlined fa"></span>
                <a class="fa" href="{{ route('frontend.address.book') }}">Address Book</a>
            </li>
            <li>
                <span class="fa material-symbols-outlined">flag</span>
                <a class="fa" href="{{ route('frontend.dash-my-order') }}">My Orders</a>
            </li>
            <hr>
            <h4>Advanced</h4>
            <li>
                <span class="fa material-symbols-outlined">person</span>
            <a class="fa" href="{{ route('frontend.dash-cancellation') }}">My Returns &
                Cancellations</a>
            </li>
            <li>
                <span class="fa material-symbols-outlined">group</span>
                <a href="#" class="fa">Developer </a>
            </li>
            <li>
                <span class="fa material-symbols-outlined">ambient_screen</span>
                <a href="#" class="fa">Magic Build</a>
            </li>
            <li>
                <span class="fa material-symbols-outlined">pacemaker</span>
                <a href="#" class="fa">Theme Maker</a>
            </li>
            <li>
                <span class="fa material-symbols-outlined">monitoring</span>
                <a href="#" class="fa">Analytic</a>
            </li>
            <hr>
            <h4>Account</h4>
            <li>
                <span class="fa material-symbols-outlined">bar_chart</span>
                <a href="#" class="fa">Overview</a>
            </li>
            <li>
                <span class="fa material-symbols-outlined">mail</span>
                <a href="#" class="fa">Message</a>
            </li>
            <li>
                <span class="fa material-symbols-outlined">settings</span>
                <a href="#" class="fa">Settings</a>
            </li>
        </ul>
    </aside>  
</div>

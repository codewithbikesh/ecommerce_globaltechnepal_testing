<div class="leftSideBar">
    <aside class="sidebar">
        <ul class="links">
            <h4>Main Menu</h4>
            {{-- <li>
                <span class="material-symbols-outlined">dashboard</span>
                <a href="#">Dashboard</a>
            </li> --}}
            <li>
                <span class="material-symbols-outlined">show_chart</span>
                <a class="dash-active" href="{{ route('frontend.account') }}">Manage My
                    Account</a>
            </li>
              <li>
                <span class="ri-map-pin-line material-symbols-outlined"></span>
                <a href="{{ route('frontend.address.book') }}">Address Book</a>
            </li>
            <li>
                <span class="material-symbols-outlined">flag</span>
                <a href="{{ route('frontend.dash-my-order') }}">My Orders</a>
            </li>
            <hr>
            <h4>Advanced</h4>
            <li>
                <span class="material-symbols-outlined">person</span>
            <a href="{{ route('frontend.dash-cancellation') }}">My Returns &
                Cancellations</a>
            </li>
            <li>
                <span class="material-symbols-outlined">group</span>
                <a href="#">Developer </a>
            </li>
            <li>
                <span class="material-symbols-outlined">ambient_screen</span>
                <a href="#">Magic Build</a>
            </li>
            <li>
                <span class="material-symbols-outlined">pacemaker</span>
                <a href="#">Theme Maker</a>
            </li>
            <li>
                <span class="material-symbols-outlined">monitoring</span>
                <a href="#">Analytic</a>
            </li>
            <hr>
            <h4>Account</h4>
            <li>
                <span class="material-symbols-outlined">bar_chart</span>
                <a href="#">Overview</a>
            </li>
            <li>
                <span class="material-symbols-outlined">mail</span>
                <a href="#">Message</a>
            </li>
            <li>
                <span class="material-symbols-outlined">settings</span>
                <a href="#">Settings</a>
            </li>
        </ul>
    </aside>  
</div>

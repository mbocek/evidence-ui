<script>
    import { NavItem, NavLink } from "sveltestrap";
    import { navigate } from "svelte-routing";

    export let icon;
    export let to = "/";
</script>

<NavItem>
    <NavLink on:click={() => navigate(to)}>
        {#if icon}
            <i class="fa fa-{icon}" />
        {/if}
        <slot />
    </NavLink>
</NavItem>

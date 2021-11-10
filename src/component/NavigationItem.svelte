<script>
    import { NavItem, NavLink } from "sveltestrap";
    import { navigate } from "svelte-routing";

    export let to = "/";
</script>

<NavItem>
    <NavLink on:click={() => navigate(to)}>
        <slot />
    </NavLink>
</NavItem>

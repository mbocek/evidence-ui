<script>
    import { Alert } from "sveltestrap";

    export let error;
</script>

{#if error}
<Alert color="danger" dismissible>
    {#each error.errors as message}
    <h4 class="alert-heading text-capitalize">{message}</h4>
    {/each}
    <hr/>
    <h5>Status code: {error.status}</h5>
    {error.message}
</Alert>
{/if}

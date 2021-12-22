<script>
    import Fa from 'svelte-fa'
    import { faInfoCircle } from '@fortawesome/free-solid-svg-icons'
    import { Alert, Collapse } from "sveltestrap";

    export let error;
    let isOpen;
</script>

{#if error}
<Alert color="danger" dismissible>
    <div class="d-flex justify-content-between">
        <div>
            <h4 class="alert-heading">{error.message}</h4>
        </div>
        <div>
            <a href="#" class="btn btn-secondary btn-sm" on:click={() => (isOpen = !isOpen)}><Fa icon={faInfoCircle}/></a>
        </div>
    </div>
    <hr/>
    {#if error.message === "Validation error"}
    {#each error.fieldErrors as fieldError}
        {fieldError.object}.{fieldError.field} - {fieldError.message}<br/>
    {/each}
    {:else}
    <h5>Status code: {error.status}</h5>
    {/if}
    <Collapse {isOpen}>
        <small>{error.timestamp}</small>
        <pre style="white-space: normal;">{error.detail}</pre>
    </Collapse>
</Alert>
{/if}

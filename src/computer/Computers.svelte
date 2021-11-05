<script>
    import { Container, Table } from "sveltestrap";

    import { onMount } from "svelte";
    import { httpGet } from "../common/api.js";

    let computers = [];
    onMount(async function () {
        const { data } = await httpGet("/computers");
        computers = data;
    });
</script>

<Table>
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Domain</th>
            <th>Vendor</th>
        </tr>
    </thead>
    <tbody>
        {#each computers as computer}
            <tr>
                <th scope="row">{computer.id}</th>
                <td>{computer.name}</td>
                <td>{computer.domain}</td>
                <td>{computer.vendor}</td>
            </tr>
        {/each}
    </tbody>
</Table>

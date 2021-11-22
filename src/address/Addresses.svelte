<script>
    import Fa from 'svelte-fa'
    import { faInfoCircle, faTrash, faPlusCircle } from '@fortawesome/free-solid-svg-icons'
    import { Table, Button, Card, CardHeader, CardBody, Container } from "sveltestrap";
    import { Link, navigate } from "svelte-routing";

    import { onMount } from "svelte";
    import { httpGet, httpDelete } from "../common/api.js";

    let addresses = [];
    onMount(async function () {
        const { data } = await httpGet("/addresses");
        addresses = data;
    });

    async function handleDelete(id) {
        const {ok} = await httpDelete("/addresses/" + id);
        if (ok) {
            const { data } = await httpGet("/addresses");
            addresses = data;
        }
    };
</script>

<Card>
    <CardHeader>
        Addresses list
        <Button size="sm" class="float-end" on:click={() => navigate("/addresses/new")}>Add</Button>
    </CardHeader>
    <CardBody>
        <Table striped hover>
            <thead>
                <tr>
                    <th>#</th>
                    <th>City</th>
                    <th>Street</th>
                    <th colspan="2">Zip</th>
                </tr>
            </thead>
            <tbody>
                {#each addresses as address}
                    <tr>
                        <th scope="row">{address.id}</th>
                        <td>{address.city}</td>
                        <td>{address.street}</td>
                        <td>{address.zip}</td>
                        <td align="right">
                            <Link to="/addresses/{address.id}" title="Address detail" class="btn btn-secondary btn-sm"><Fa icon={faInfoCircle} /></Link>
                            <Link to="/addresses" title="Delete address" class="btn btn-danger btn-sm" on:click={() => {handleDelete(address.id)}}><Fa icon={faTrash} /></Link>
                        </td>
                    </tr>
                {/each}
            </tbody>
        </Table>

    </CardBody>
</Card>

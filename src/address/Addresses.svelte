<script>
    import Fa from 'svelte-fa'
    import { faInfoCircle, faTrash, faPlusCircle } from '@fortawesome/free-solid-svg-icons'
    import { Table, Button, Card, CardHeader, CardBody, Container } from "sveltestrap";
    import { Link, navigate } from "svelte-routing";

    import { onMount } from "svelte";
    import { httpGet, httpDelete } from "../common/api.js";
    import ErrorMessage from "../component/ErrorMessage.svelte";

    let addresses = [];
    let error;

    onMount(async function () {
        let result = await httpGet("/addresses");
        if (result.ok) {
            addresses = result.data;
        } else {
            error = result.data;
        }
    });

    async function handleDelete(id) {
        let result = await httpDelete("/addresses/" + id);
        if (result.ok) {
            result = await httpGet("/addresses");
            if (result.ok) {
                addresses = result.data;
            } else {
                error = result.data;
            }
        } else {
            error = result.data;
        }
    };
</script>

<ErrorMessage error={error} />

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

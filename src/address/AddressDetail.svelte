<script>
    import { navigate } from "svelte-routing";
    import { Form, FormGroup, Input, Label, Button, Card, CardHeader, CardBody, Col, Row } from "sveltestrap";
    import { onMount } from "svelte";
    import { httpPut, httpGet } from "../common/api.js";

    export let id;
    let address = {};

    onMount(async function () {
        const { data } = await httpGet("/addresses/" + id);
        address = data;
    });

    async function handleSubmit(event) {
        event.preventDefault();
        const { ok } = await httpPut("/addresses/" + address.id, address);
        if (ok) {
            navigate("/addresses");
        }
    }
</script>

<Card>
    <CardHeader>
        Address details
    </CardHeader>
    <CardBody>
        <Form on:submit={handleSubmit}>
        <Input hidden id="id" bind:value={address.id} />
            <FormGroup row>
                <Label for="street" sm="2">Street</Label>
                <Col sm="10">
                    <Input id="street" placeholder="Address street" bind:value={address.street} />
                </Col>
            </FormGroup>
            <FormGroup row>
                <Label for="city" sm="2">City</Label>
                <Col sm="10">
                    <Input id="city" placeholder="Address city" bind:value={address.city} />
                </Col>
            </FormGroup>
            <FormGroup row>
                <Label for="zip" sm="2">Zip</Label>
                <Col sm="10">
                    <Input id="zip" placeholder="Address zip" bind:value={address.zip} />
                </Col>
            </FormGroup>
            <Row>
                <Col sm="12">
                    <Button class="float-end">Save</Button>
                </Col>
            </Row>
        </Form>
    </CardBody>
</Card>

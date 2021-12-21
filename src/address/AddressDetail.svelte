<script>
    import { navigate } from "svelte-routing";
    import { Form, FormGroup, Input, Label, Button, Card, CardHeader, CardBody, Col, Row } from "sveltestrap";
    import { onMount } from "svelte";
    import { httpPut, httpGet } from "../common/api.js";
    import ErrorMessage from "../component/ErrorMessage.svelte";

    export let id;
    let address = {};
    let error;

    onMount(async function () {
        let result = await httpGet("/addresses/" + id);
        if (result.ok) {
            address = result.data;
        } else {
            error = result.data;
        }

    });

    async function handleSubmit(event) {
        event.preventDefault();
        let result = await httpPut("/addresses/" + address.id, address);
        if (result.ok) {
            navigate("/addresses");
        } else {
            error = result.data;
        }
    }
</script>

<ErrorMessage error={error} />

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

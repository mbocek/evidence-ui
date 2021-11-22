<script>
    import { navigate } from "svelte-routing";
    import { Form, FormGroup, Input, Label, Button, Card, CardHeader, CardBody, Col, Row } from "sveltestrap";
    import { httpPost } from "../common/api.js";

    let address = {};

    async function handleSubmit(event) {
        event.preventDefault();
        const { ok } = await httpPost("/addresses", address);
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

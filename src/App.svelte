<script>
    import { Styles, Navbar, NavbarBrand, Nav, NavItem, NavLink, Container, Row, ListGroup, ListGroupItem } from "sveltestrap";
    import Computers from "./computer/Computers.svelte";
</script>

<Styles />

<Navbar class="navbar-dark bg-dark p-0">
    <NavbarBrand href="/">Evidence</NavbarBrand>
    <Nav navbar>XXX</Nav>
</Navbar>

<Container fluid>
    <Row>
        <Navbar class="col-md-2 d-md-block bg-light sidebar">
            <Nav>
                <NavItem>
                    <NavLink active>Computers</NavLink>
                </NavItem>
                <NavItem>
                    <NavLink>Test</NavLink>
                </NavItem>
            </Nav>
        </Navbar>
        <main role="main" class="col-md-10">
            <Container>
                <Computers />
            </Container>
        </main>
    </Row>
</Container>
